# coding: utf-8
from . import db
from sqlalchemy import ARRAY, Column, Enum, ForeignKey, Integer, SmallInteger, String, Table
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = db.Model
metadata = Base.metadata


class Clas(Base):
    __tablename__ = 'class'

    c_classid = Column(Integer, primary_key=True)
    c_classname = Column(String(15), nullable=False)


t_effective = Table(
    'effective', metadata,
    Column('e_effectiveid', Integer, nullable=False),
    Column('e_supeffect', ARRAY(Integer())),
    Column('e_neutral', ARRAY(Integer()), nullable=False),
    Column('e_nveffect', ARRAY(Integer())),
    Column('e_immune', ARRAY(Integer()))
)


class Nature(Base):
    __tablename__ = 'nature'

    n_natureid = Column(Integer, primary_key=True)
    n_name = Column(String(15), nullable=False)
    n_statbonus = Column(Enum('hp', 'atk', 'def', 'spatk', 'spdef', 'spd', name='stat'), nullable=False)
    n_statdefect = Column(Enum('hp', 'atk', 'def', 'spatk', 'spdef', 'spd', name='stat'), nullable=False)


class Pokemon(Base):
    __tablename__ = 'pokemon'

    p_pokemonid = Column(Integer, primary_key=True)
    p_typescombo = Column(ForeignKey('typecombo.tc_id'), nullable=False)
    p_name = Column(String(50), nullable=False)
    p_gender = Column(Enum('Male', 'Female', 'Genderless', name='gender'), nullable=False)
    p_level = Column(SmallInteger, nullable=False)
    p_pokedexid = Column(Integer, nullable=False)
    p_trainerid = Column(ForeignKey('trainer.tr_trainerid'), nullable=False)
    p_movepool = Column(ForeignKey('movepool.mp_id'), nullable=False)
    p_natureid = Column(ForeignKey('nature.n_natureid'), nullable=False)

    movepool = relationship('Movepool')
    nature = relationship('Nature')
    trainer = relationship('Trainer')
    typecombo = relationship('Typecombo')


class Pokemonparty(Base):
    __tablename__ = 'pokemonparty'

    pp_id = Column(Integer, primary_key=True)
    pp_firstpokemon = Column(ForeignKey('pokemon.p_pokemonid'), nullable=False)
    pp_secondpokemon = Column(ForeignKey('pokemon.p_pokemonid'))
    pp_thirdpokemon = Column(ForeignKey('pokemon.p_pokemonid'))
    pp_fourthpokemon = Column(ForeignKey('pokemon.p_pokemonid'))
    pp_fifthpokemon = Column(ForeignKey('pokemon.p_pokemonid'))
    pp_sixthpokemon = Column(ForeignKey('pokemon.p_pokemonid'))

    pokemon = relationship('Pokemon', primaryjoin='Pokemonparty.pp_fifthpokemon == Pokemon.p_pokemonid')
    pokemon1 = relationship('Pokemon', primaryjoin='Pokemonparty.pp_firstpokemon == Pokemon.p_pokemonid')
    pokemon2 = relationship('Pokemon', primaryjoin='Pokemonparty.pp_fourthpokemon == Pokemon.p_pokemonid')
    pokemon3 = relationship('Pokemon', primaryjoin='Pokemonparty.pp_secondpokemon == Pokemon.p_pokemonid')
    pokemon4 = relationship('Pokemon', primaryjoin='Pokemonparty.pp_sixthpokemon == Pokemon.p_pokemonid')
    pokemon5 = relationship('Pokemon', primaryjoin='Pokemonparty.pp_thirdpokemon == Pokemon.p_pokemonid')


class Trainer(Base):
    __tablename__ = 'trainer'

    tr_trainerid = Column(Integer, primary_key=True)
    tr_classid = Column(ForeignKey('class.c_classid'), nullable=False)
    tr_money_given = Column(Integer, nullable=False)
    tr_name = Column(String(15), nullable=False)
    tr_pokemonparty = Column(ForeignKey('pokemonparty.pp_id'), nullable=False)

    clas = relationship('Clas')
    pokemonparty = relationship('Pokemonparty')


class Type(Base):
    __tablename__ = 'types'

    t_typeid = Column(Integer, primary_key=True)
    t_name = Column(String(15), nullable=False)
    t_effectiveid = Column(Integer, nullable=False)


class Immune(Base):
    __tablename__ = 'immune'

    i_effectiveid = Column(Integer, primary_key=True, nullable=False)
    i_typeid = Column(ForeignKey('types.t_typeid'), primary_key=True, nullable=False)

    type = relationship('Type')


class Move(Base):
    __tablename__ = 'moves'

    m_moveid = Column(Integer, primary_key=True)
    m_name = Column(String(30), nullable=False)
    m_power = Column(Integer, nullable=False)
    m_acc = Column(Integer, nullable=False)
    m_type = Column(ForeignKey('types.t_typeid'), nullable=False)
    m_pp = Column(Integer, nullable=False)

    type = relationship('Type')


class Neutraleffective(Base):
    __tablename__ = 'neutraleffective'

    ne_effectiveid = Column(Integer, primary_key=True, nullable=False)
    ne_typeid = Column(ForeignKey('types.t_typeid'), primary_key=True, nullable=False)

    type = relationship('Type')


class Notveryeffective(Base):
    __tablename__ = 'notveryeffective'

    nve_effectiveid = Column(Integer, primary_key=True, nullable=False)
    nve_typeid = Column(ForeignKey('types.t_typeid'), primary_key=True, nullable=False)

    type = relationship('Type')


class Supereffective(Base):
    __tablename__ = 'supereffective'

    se_effectiveid = Column(Integer, primary_key=True, nullable=False)
    se_typeid = Column(ForeignKey('types.t_typeid'), primary_key=True, nullable=False)

    type = relationship('Type')


class Typecombo(Base):
    __tablename__ = 'typecombo'

    tc_id = Column(Integer, primary_key=True)
    tc_firsttype = Column(ForeignKey('types.t_typeid'), nullable=False)
    tc_secondtype = Column(ForeignKey('types.t_typeid'))

    type = relationship('Type', primaryjoin='Typecombo.tc_firsttype == Type.t_typeid')
    type1 = relationship('Type', primaryjoin='Typecombo.tc_secondtype == Type.t_typeid')


class Movepool(Base):
    __tablename__ = 'movepool'

    mp_id = Column(Integer, primary_key=True)
    mp_firstmoveid = Column(ForeignKey('moves.m_moveid'), nullable=False)
    mp_secondmoveid = Column(ForeignKey('moves.m_moveid'))
    mp_thirdmoveid = Column(ForeignKey('moves.m_moveid'))
    mp_fourthmoveid = Column(ForeignKey('moves.m_moveid'))

    move = relationship('Move', primaryjoin='Movepool.mp_firstmoveid == Move.m_moveid')
    move1 = relationship('Move', primaryjoin='Movepool.mp_fourthmoveid == Move.m_moveid')
    move2 = relationship('Move', primaryjoin='Movepool.mp_secondmoveid == Move.m_moveid')
    move3 = relationship('Move', primaryjoin='Movepool.mp_thirdmoveid == Move.m_moveid')
