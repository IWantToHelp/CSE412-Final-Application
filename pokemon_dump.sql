PGDMP  *    5            
    |            Pokemon    16.4    16.4 F    Y           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Z           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            [           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            \           1262    17003    Pokemon    DATABASE     �   CREATE DATABASE "Pokemon" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "Pokemon";
                postgres    false            X           1247    20077    gender    TYPE     R   CREATE TYPE public.gender AS ENUM (
    'Male',
    'Female',
    'Genderless'
);
    DROP TYPE public.gender;
       public          postgres    false                       1247    20120    stat    TYPE     i   CREATE TYPE public.stat AS ENUM (
    'hp',
    'atk',
    'def',
    'spatk',
    'spdef',
    'spd'
);
    DROP TYPE public.stat;
       public          postgres    false            �            1259    20095    class    TABLE     n   CREATE TABLE public.class (
    c_classid integer NOT NULL,
    c_classname character varying(15) NOT NULL
);
    DROP TABLE public.class;
       public         heap    postgres    false            �            1259    17035 	   effective    TABLE     �   CREATE TABLE public.effective (
    e_effectiveid integer NOT NULL,
    e_supeffect integer[],
    e_neutral integer[] NOT NULL,
    e_nveffect integer[],
    e_immune integer[]
);
    DROP TABLE public.effective;
       public         heap    postgres    false            �            1259    20113    immune    TABLE     b   CREATE TABLE public.immune (
    i_effectiveid integer NOT NULL,
    i_typeid integer NOT NULL
);
    DROP TABLE public.immune;
       public         heap    postgres    false            �            1259    20092    movepool    TABLE     �   CREATE TABLE public.movepool (
    mp_id integer NOT NULL,
    mp_firstmoveid integer NOT NULL,
    mp_secondmoveid integer,
    mp_thirdmoveid integer,
    mp_fourthmoveid integer
);
    DROP TABLE public.movepool;
       public         heap    postgres    false            �            1259    20116    moves    TABLE     �   CREATE TABLE public.moves (
    m_moveid integer NOT NULL,
    m_name character varying(30) NOT NULL,
    m_power integer NOT NULL,
    m_acc integer NOT NULL,
    m_type integer NOT NULL,
    m_pp integer NOT NULL
);
    DROP TABLE public.moves;
       public         heap    postgres    false            �            1259    20133    nature    TABLE     �   CREATE TABLE public.nature (
    n_natureid integer NOT NULL,
    n_name character varying(15) NOT NULL,
    n_statbonus public.stat NOT NULL,
    n_statdefect public.stat NOT NULL
);
    DROP TABLE public.nature;
       public         heap    postgres    false    895    895            �            1259    20107    neutraleffective    TABLE     n   CREATE TABLE public.neutraleffective (
    ne_effectiveid integer NOT NULL,
    ne_typeid integer NOT NULL
);
 $   DROP TABLE public.neutraleffective;
       public         heap    postgres    false            �            1259    20110    notveryeffective    TABLE     p   CREATE TABLE public.notveryeffective (
    nve_effectiveid integer NOT NULL,
    nve_typeid integer NOT NULL
);
 $   DROP TABLE public.notveryeffective;
       public         heap    postgres    false            �            1259    20083    pokemon    TABLE     Z  CREATE TABLE public.pokemon (
    p_pokemonid integer NOT NULL,
    p_typescombo integer NOT NULL,
    p_name character varying(50) NOT NULL,
    p_gender public.gender NOT NULL,
    p_level smallint NOT NULL,
    p_pokedexid integer NOT NULL,
    p_trainerid integer NOT NULL,
    p_movepool integer NOT NULL,
    p_natureid integer NOT NULL
);
    DROP TABLE public.pokemon;
       public         heap    postgres    false    856            �            1259    20086    pokemonparty    TABLE     �   CREATE TABLE public.pokemonparty (
    pp_id integer NOT NULL,
    pp_firstpokemon integer NOT NULL,
    pp_secondpokemon integer,
    pp_thirdpokemon integer,
    pp_fourthpokemon integer,
    pp_fifthpokemon integer,
    pp_sixthpokemon integer
);
     DROP TABLE public.pokemonparty;
       public         heap    postgres    false            �            1259    20104    supereffective    TABLE     l   CREATE TABLE public.supereffective (
    se_effectiveid integer NOT NULL,
    se_typeid integer NOT NULL
);
 "   DROP TABLE public.supereffective;
       public         heap    postgres    false            �            1259    20098    trainer    TABLE     �   CREATE TABLE public.trainer (
    tr_trainerid integer NOT NULL,
    tr_classid integer NOT NULL,
    tr_money_given integer NOT NULL,
    tr_name character varying(15) NOT NULL,
    tr_pokemonparty integer NOT NULL
);
    DROP TABLE public.trainer;
       public         heap    postgres    false            �            1259    20089 	   typecombo    TABLE     |   CREATE TABLE public.typecombo (
    tc_id integer NOT NULL,
    tc_firsttype integer NOT NULL,
    tc_secondtype integer
);
    DROP TABLE public.typecombo;
       public         heap    postgres    false            �            1259    20101    types    TABLE     �   CREATE TABLE public.types (
    t_typeid integer NOT NULL,
    t_name character varying(15) NOT NULL,
    t_effectiveid integer NOT NULL
);
    DROP TABLE public.types;
       public         heap    postgres    false            N          0    20095    class 
   TABLE DATA           7   COPY public.class (c_classid, c_classname) FROM stdin;
    public          postgres    false    220   >Z       I          0    17035 	   effective 
   TABLE DATA           `   COPY public.effective (e_effectiveid, e_supeffect, e_neutral, e_nveffect, e_immune) FROM stdin;
    public          postgres    false    215   �Z       T          0    20113    immune 
   TABLE DATA           9   COPY public.immune (i_effectiveid, i_typeid) FROM stdin;
    public          postgres    false    226   	[       M          0    20092    movepool 
   TABLE DATA           k   COPY public.movepool (mp_id, mp_firstmoveid, mp_secondmoveid, mp_thirdmoveid, mp_fourthmoveid) FROM stdin;
    public          postgres    false    219   L[       U          0    20116    moves 
   TABLE DATA           O   COPY public.moves (m_moveid, m_name, m_power, m_acc, m_type, m_pp) FROM stdin;
    public          postgres    false    227   �[       V          0    20133    nature 
   TABLE DATA           O   COPY public.nature (n_natureid, n_name, n_statbonus, n_statdefect) FROM stdin;
    public          postgres    false    228   ۃ       R          0    20107    neutraleffective 
   TABLE DATA           E   COPY public.neutraleffective (ne_effectiveid, ne_typeid) FROM stdin;
    public          postgres    false    224   �       S          0    20110    notveryeffective 
   TABLE DATA           G   COPY public.notveryeffective (nve_effectiveid, nve_typeid) FROM stdin;
    public          postgres    false    225   6�       J          0    20083    pokemon 
   TABLE DATA           �   COPY public.pokemon (p_pokemonid, p_typescombo, p_name, p_gender, p_level, p_pokedexid, p_trainerid, p_movepool, p_natureid) FROM stdin;
    public          postgres    false    216   ~�       K          0    20086    pokemonparty 
   TABLE DATA           �   COPY public.pokemonparty (pp_id, pp_firstpokemon, pp_secondpokemon, pp_thirdpokemon, pp_fourthpokemon, pp_fifthpokemon, pp_sixthpokemon) FROM stdin;
    public          postgres    false    217   �       Q          0    20104    supereffective 
   TABLE DATA           C   COPY public.supereffective (se_effectiveid, se_typeid) FROM stdin;
    public          postgres    false    223   R�       O          0    20098    trainer 
   TABLE DATA           e   COPY public.trainer (tr_trainerid, tr_classid, tr_money_given, tr_name, tr_pokemonparty) FROM stdin;
    public          postgres    false    221   ��       L          0    20089 	   typecombo 
   TABLE DATA           G   COPY public.typecombo (tc_id, tc_firsttype, tc_secondtype) FROM stdin;
    public          postgres    false    218   �       P          0    20101    types 
   TABLE DATA           @   COPY public.types (t_typeid, t_name, t_effectiveid) FROM stdin;
    public          postgres    false    222   C�       �           2606    20490    class class_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (c_classid);
 :   ALTER TABLE ONLY public.class DROP CONSTRAINT class_pkey;
       public            postgres    false    220            �           2606    20504    immune immune_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.immune
    ADD CONSTRAINT immune_pkey PRIMARY KEY (i_effectiveid, i_typeid);
 <   ALTER TABLE ONLY public.immune DROP CONSTRAINT immune_pkey;
       public            postgres    false    226    226            �           2606    20508    movepool movepool_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.movepool
    ADD CONSTRAINT movepool_pkey PRIMARY KEY (mp_id);
 @   ALTER TABLE ONLY public.movepool DROP CONSTRAINT movepool_pkey;
       public            postgres    false    219            �           2606    20506    moves moves_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.moves
    ADD CONSTRAINT moves_pkey PRIMARY KEY (m_moveid);
 :   ALTER TABLE ONLY public.moves DROP CONSTRAINT moves_pkey;
       public            postgres    false    227            �           2606    20510    nature nature_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.nature
    ADD CONSTRAINT nature_pkey PRIMARY KEY (n_natureid);
 <   ALTER TABLE ONLY public.nature DROP CONSTRAINT nature_pkey;
       public            postgres    false    228            �           2606    20500 &   neutraleffective neutraleffective_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.neutraleffective
    ADD CONSTRAINT neutraleffective_pkey PRIMARY KEY (ne_effectiveid, ne_typeid);
 P   ALTER TABLE ONLY public.neutraleffective DROP CONSTRAINT neutraleffective_pkey;
       public            postgres    false    224    224            �           2606    20502 &   notveryeffective notveryeffective_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.notveryeffective
    ADD CONSTRAINT notveryeffective_pkey PRIMARY KEY (nve_effectiveid, nve_typeid);
 P   ALTER TABLE ONLY public.notveryeffective DROP CONSTRAINT notveryeffective_pkey;
       public            postgres    false    225    225            �           2606    20486    pokemon pokemon_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT pokemon_pkey PRIMARY KEY (p_pokemonid);
 >   ALTER TABLE ONLY public.pokemon DROP CONSTRAINT pokemon_pkey;
       public            postgres    false    216            �           2606    20488    pokemonparty pokemonparty_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.pokemonparty
    ADD CONSTRAINT pokemonparty_pkey PRIMARY KEY (pp_id);
 H   ALTER TABLE ONLY public.pokemonparty DROP CONSTRAINT pokemonparty_pkey;
       public            postgres    false    217            �           2606    20498 "   supereffective supereffective_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.supereffective
    ADD CONSTRAINT supereffective_pkey PRIMARY KEY (se_effectiveid, se_typeid);
 L   ALTER TABLE ONLY public.supereffective DROP CONSTRAINT supereffective_pkey;
       public            postgres    false    223    223            �           2606    20492    trainer trainer_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.trainer
    ADD CONSTRAINT trainer_pkey PRIMARY KEY (tr_trainerid);
 >   ALTER TABLE ONLY public.trainer DROP CONSTRAINT trainer_pkey;
       public            postgres    false    221            �           2606    20496    typecombo typecombo_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.typecombo
    ADD CONSTRAINT typecombo_pkey PRIMARY KEY (tc_id);
 B   ALTER TABLE ONLY public.typecombo DROP CONSTRAINT typecombo_pkey;
       public            postgres    false    218            �           2606    20494    types types_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (t_typeid);
 :   ALTER TABLE ONLY public.types DROP CONSTRAINT types_pkey;
       public            postgres    false    222            �           2606    20526    immune immune_i_typeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.immune
    ADD CONSTRAINT immune_i_typeid_fkey FOREIGN KEY (i_typeid) REFERENCES public.types(t_typeid);
 E   ALTER TABLE ONLY public.immune DROP CONSTRAINT immune_i_typeid_fkey;
       public          postgres    false    222    4758    226            �           2606    20606 %   movepool movepool_mp_firstmoveid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movepool
    ADD CONSTRAINT movepool_mp_firstmoveid_fkey FOREIGN KEY (mp_firstmoveid) REFERENCES public.moves(m_moveid);
 O   ALTER TABLE ONLY public.movepool DROP CONSTRAINT movepool_mp_firstmoveid_fkey;
       public          postgres    false    4768    219    227            �           2606    20621 &   movepool movepool_mp_fourthmoveid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movepool
    ADD CONSTRAINT movepool_mp_fourthmoveid_fkey FOREIGN KEY (mp_fourthmoveid) REFERENCES public.moves(m_moveid);
 P   ALTER TABLE ONLY public.movepool DROP CONSTRAINT movepool_mp_fourthmoveid_fkey;
       public          postgres    false    219    4768    227            �           2606    20611 &   movepool movepool_mp_secondmoveid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movepool
    ADD CONSTRAINT movepool_mp_secondmoveid_fkey FOREIGN KEY (mp_secondmoveid) REFERENCES public.moves(m_moveid);
 P   ALTER TABLE ONLY public.movepool DROP CONSTRAINT movepool_mp_secondmoveid_fkey;
       public          postgres    false    219    227    4768            �           2606    20616 %   movepool movepool_mp_thirdmoveid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movepool
    ADD CONSTRAINT movepool_mp_thirdmoveid_fkey FOREIGN KEY (mp_thirdmoveid) REFERENCES public.moves(m_moveid);
 O   ALTER TABLE ONLY public.movepool DROP CONSTRAINT movepool_mp_thirdmoveid_fkey;
       public          postgres    false    227    219    4768            �           2606    20601    moves moves_m_type_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.moves
    ADD CONSTRAINT moves_m_type_fkey FOREIGN KEY (m_type) REFERENCES public.types(t_typeid);
 A   ALTER TABLE ONLY public.moves DROP CONSTRAINT moves_m_type_fkey;
       public          postgres    false    4758    227    222            �           2606    20516 0   neutraleffective neutraleffective_ne_typeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.neutraleffective
    ADD CONSTRAINT neutraleffective_ne_typeid_fkey FOREIGN KEY (ne_typeid) REFERENCES public.types(t_typeid);
 Z   ALTER TABLE ONLY public.neutraleffective DROP CONSTRAINT neutraleffective_ne_typeid_fkey;
       public          postgres    false    222    224    4758            �           2606    20521 1   notveryeffective notveryeffective_nve_typeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notveryeffective
    ADD CONSTRAINT notveryeffective_nve_typeid_fkey FOREIGN KEY (nve_typeid) REFERENCES public.types(t_typeid);
 [   ALTER TABLE ONLY public.notveryeffective DROP CONSTRAINT notveryeffective_nve_typeid_fkey;
       public          postgres    false    4758    222    225            �           2606    20546    pokemon pokemon_p_movepool_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT pokemon_p_movepool_fkey FOREIGN KEY (p_movepool) REFERENCES public.movepool(mp_id);
 I   ALTER TABLE ONLY public.pokemon DROP CONSTRAINT pokemon_p_movepool_fkey;
       public          postgres    false    219    216    4752            �           2606    20551    pokemon pokemon_p_natureid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT pokemon_p_natureid_fkey FOREIGN KEY (p_natureid) REFERENCES public.nature(n_natureid);
 I   ALTER TABLE ONLY public.pokemon DROP CONSTRAINT pokemon_p_natureid_fkey;
       public          postgres    false    216    228    4770            �           2606    20541     pokemon pokemon_p_trainerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT pokemon_p_trainerid_fkey FOREIGN KEY (p_trainerid) REFERENCES public.trainer(tr_trainerid);
 J   ALTER TABLE ONLY public.pokemon DROP CONSTRAINT pokemon_p_trainerid_fkey;
       public          postgres    false    4756    221    216            �           2606    20556 !   pokemon pokemon_p_typescombo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT pokemon_p_typescombo_fkey FOREIGN KEY (p_typescombo) REFERENCES public.typecombo(tc_id);
 K   ALTER TABLE ONLY public.pokemon DROP CONSTRAINT pokemon_p_typescombo_fkey;
       public          postgres    false    216    218    4750            �           2606    20581 .   pokemonparty pokemonparty_pp_fifthpokemon_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pokemonparty
    ADD CONSTRAINT pokemonparty_pp_fifthpokemon_fkey FOREIGN KEY (pp_fifthpokemon) REFERENCES public.pokemon(p_pokemonid);
 X   ALTER TABLE ONLY public.pokemonparty DROP CONSTRAINT pokemonparty_pp_fifthpokemon_fkey;
       public          postgres    false    216    4746    217            �           2606    20561 .   pokemonparty pokemonparty_pp_firstpokemon_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pokemonparty
    ADD CONSTRAINT pokemonparty_pp_firstpokemon_fkey FOREIGN KEY (pp_firstpokemon) REFERENCES public.pokemon(p_pokemonid);
 X   ALTER TABLE ONLY public.pokemonparty DROP CONSTRAINT pokemonparty_pp_firstpokemon_fkey;
       public          postgres    false    216    217    4746            �           2606    20576 /   pokemonparty pokemonparty_pp_fourthpokemon_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pokemonparty
    ADD CONSTRAINT pokemonparty_pp_fourthpokemon_fkey FOREIGN KEY (pp_fourthpokemon) REFERENCES public.pokemon(p_pokemonid);
 Y   ALTER TABLE ONLY public.pokemonparty DROP CONSTRAINT pokemonparty_pp_fourthpokemon_fkey;
       public          postgres    false    4746    217    216            �           2606    20566 /   pokemonparty pokemonparty_pp_secondpokemon_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pokemonparty
    ADD CONSTRAINT pokemonparty_pp_secondpokemon_fkey FOREIGN KEY (pp_secondpokemon) REFERENCES public.pokemon(p_pokemonid);
 Y   ALTER TABLE ONLY public.pokemonparty DROP CONSTRAINT pokemonparty_pp_secondpokemon_fkey;
       public          postgres    false    217    216    4746            �           2606    20586 .   pokemonparty pokemonparty_pp_sixthpokemon_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pokemonparty
    ADD CONSTRAINT pokemonparty_pp_sixthpokemon_fkey FOREIGN KEY (pp_sixthpokemon) REFERENCES public.pokemon(p_pokemonid);
 X   ALTER TABLE ONLY public.pokemonparty DROP CONSTRAINT pokemonparty_pp_sixthpokemon_fkey;
       public          postgres    false    217    4746    216            �           2606    20571 .   pokemonparty pokemonparty_pp_thirdpokemon_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pokemonparty
    ADD CONSTRAINT pokemonparty_pp_thirdpokemon_fkey FOREIGN KEY (pp_thirdpokemon) REFERENCES public.pokemon(p_pokemonid);
 X   ALTER TABLE ONLY public.pokemonparty DROP CONSTRAINT pokemonparty_pp_thirdpokemon_fkey;
       public          postgres    false    216    4746    217            �           2606    20511 ,   supereffective supereffective_se_typeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.supereffective
    ADD CONSTRAINT supereffective_se_typeid_fkey FOREIGN KEY (se_typeid) REFERENCES public.types(t_typeid);
 V   ALTER TABLE ONLY public.supereffective DROP CONSTRAINT supereffective_se_typeid_fkey;
       public          postgres    false    4758    222    223            �           2606    20531    trainer trainer_tr_classid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trainer
    ADD CONSTRAINT trainer_tr_classid_fkey FOREIGN KEY (tr_classid) REFERENCES public.class(c_classid);
 I   ALTER TABLE ONLY public.trainer DROP CONSTRAINT trainer_tr_classid_fkey;
       public          postgres    false    4754    220    221            �           2606    20536 $   trainer trainer_tr_pokemonparty_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trainer
    ADD CONSTRAINT trainer_tr_pokemonparty_fkey FOREIGN KEY (tr_pokemonparty) REFERENCES public.pokemonparty(pp_id);
 N   ALTER TABLE ONLY public.trainer DROP CONSTRAINT trainer_tr_pokemonparty_fkey;
       public          postgres    false    221    217    4748            �           2606    20591 %   typecombo typecombo_tc_firsttype_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.typecombo
    ADD CONSTRAINT typecombo_tc_firsttype_fkey FOREIGN KEY (tc_firsttype) REFERENCES public.types(t_typeid);
 O   ALTER TABLE ONLY public.typecombo DROP CONSTRAINT typecombo_tc_firsttype_fkey;
       public          postgres    false    218    222    4758            �           2606    20596 &   typecombo typecombo_tc_secondtype_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.typecombo
    ADD CONSTRAINT typecombo_tc_secondtype_fkey FOREIGN KEY (tc_secondtype) REFERENCES public.types(t_typeid);
 P   ALTER TABLE ONLY public.typecombo DROP CONSTRAINT typecombo_tc_secondtype_fkey;
       public          postgres    false    4758    222    218            N   �   x�5�M
�0��3��	Ĵ�oi�*XAč�fH����$B��9��ٸzǓ��,n#�#p46g	*ubGQ?3Up��B�}��KPL)N���`�q&oH��[qb~ey�	y�'�rʑ�B��(%�^4Lm�d{g"�zH�J��79���=f���\3n      I      x������ � �      T   3   x���  ���Ԩ@����t�lJ&��E�Kj�7d-xh��؇�      M   >   x�U��� �޾a* 	!Kt������?��Y����E���I��dd�E��w��3ۗ��~�      U      x�e|�r�8����+��_�O����n���r���i�=�_h	��H/v�����	��'�g܍%�@"�X�H ZE�������w͸�?N�����UT���*YE����C�?���ج��6��>���1}�Y%
D1~�!R\Y��7R)Z�O]�FY�fZ��{k����C��s_]�fP� �w��X�U��7�O��2�{3So�������uլ?��*۬ʲd�E��ǦFi�d{��C��>��_�O7ٖ���s���E˴y��ן����H'J١��*O-�v0覹�9����t2M�>K�9��e��].�`3���/��[=l�?�f�+W�b�>��c�^�1h�XD�6-zѽi������ܘ�Lc���B��*7�\!��m��ftS�婖߹qji���ќ�b�B��}U7�r��C�O��~�t����T��Z�ڶkW�U�-FC}w�ƣ髳�\��Ȗ���M�Ej"��_&E1���jU��	�1�a���[ ��)�z�������n��c�Y���8J��R7'�W{vA��@�(0���H .z8�`�V�b& u ?���Tn2�$r����h���n�N�o��$��k�@G/B!�2�?k���]Fy��T=^��tM��z1�ʋK'ɀ��ǯʁ��i����x��J���5s��X��NWE�s�n������H#b�ַ�0�yNP�]AJ/�O�$��%�����W��	���ԍGt
Z�ke�fX�m��yC��B�R�a�9�ȿ��əc���6[��f���n��3��C��mʶ,���N�n����a7UC��^��b���{��u���a֑P/���BLeT\�YF�Ut�t�������O��)�A7��7�
���O:�:)�!��������952��?��J*D,�뛎�mVD����u'k��@�d��M��ae��G��w��[n4����� 0�'��[�9�Ν��� �e�+������!ǰ�֬?7�#�,����K-���h["7���O�q��*u0n��q��~�D0�n�=+TY���bMN���W���(0tZ�#6t7q���z5�O5'b����1t�0��󬊩��­�s���o��
H��Y�8=̥VI�5Ξ���~�&߁�I���Tnm��:�UB��z�x�$
L��f �05/j!��Tf,k�oߊ�d�K�!�H=}�X�s�D��	a�XZ�F�����BFշ���s��E���������n�N9��}Y�J��h�>W�	�$�lA�M��S7=54�~��6)��c�Z��o_d F��;�/�jm,��6�곩p�aX=<˼�n;�6��<�ڤ5�Ѧ\}>V��z��nc�tBu)�j��oB�U�����<� �>�����"��&�9���3{��®�*�J����*/h�>���t�v�BII"p��u��2����g�N��}�a9�bY�� #�>�ϲ������HZ�B��sӰ�uS�Z��{��6z��\���
y�Ĵ�.�ʐO�0R�/��W}.-C:]�?���"�,�6�~9���L�;�6�H�nw�Qi� �W�$����h:���-X4V��}��N�����tW]\�pB�8�V��Ą���~\9�c��P�3��(}�i��{1%S����;�Q�YP�ކ�q��1�6E�c/n��~5�#ծS�˰���P�>p�� ����[�Z!�+�@��z��O(����Ľ��Db���]��j��ԎҖ��QBAL���Bl�g�!�Q��(2�� YD���X�}�;/!A�4b#>֦9���(0��ΎH��aJ�����;9� ��;�W����v%s�m�zs.�|\Q�o}��|%�^�n�#Z�!Љ/��n����b�9�ԏ� 8��G�w�,��%�߿Š}kh��%$�������@ ��'����@���F
D#0�M`�A"�t���ۛ�l�r�.ӹ��l'���bF���`$`^a!ᡡ�_����J�X��ςR|�T�$�g7�R���׽ѹ*�׀_c���CEjjPF���Ol�@��u*�-���­�����b�T塖Cw@?�R�A�3�[O:s~�&2����]���
����2�$[T-����n-R��e�펝u�t`�6���:{/C�[�S��	(�W��{n� d7�[�`��^(M�v'��C�8�aBC^I8s0��xh%������)��,��K~�;�o}�P?~'P��iѯ��/��ϻ-������*�ߴ�]���ġw�l"-�%~�Lf�A/&	�dN�����֩�'��
Ũ���<V5%���^j�����r9Z�z{~�$&Y�nj%���
�n(��D��5�;��~����r'~�V���<��C7Z���թ��C�`R� ��s�S
������b��v�+{�'��-�k�b����ؙ�l7�Γ�~5}��y:�D�c�)�;����ޱ����z:��X>��������9k��8��2�-���,D�̽ �yS�4GB�G�Q	+:?��-�f�-S76HL��2�X�启Ӗ[���k���� d�k{0�k�/�c�a_�TW���	<�k;RN'ڕpv@H����y�|���z8�^�,�ic�*h�Gھ(���,��/0���5	ڻ�~ "�/n�`T�_��6خ��8`�D�󯿾v�]���؃P$�C��n��������[�uU���8ɴ���.�-�5��sWataV* v�>�ɇJ@P��n�{��˴DC�.��&Ģյ�h���s�aZzmjLi��TJ�q�� ���k�5�L���E�����$]�`�)�A0��`�'a�j���CϽ)o�pj���?����na̾U���i��"t��ņ&#�ڂ�
r��O&N��[�S~�̽#+rۘ�󻞃�*�	�Z������(��6��1��"4�M)��X�Ѽä��MC�)�n�d\FS��b}b�P��$!�<��b6*���7l-�1�,�5`���t�gCo[MV����pA����T�Jw�B��,h���8;A���^7f�O1,"e�f��:�AS9�Q����f�l�9E�U�������Oۜ��x2��T���5IQP��>m��a��Q�\GjSsJ���Ką�Oå���Zr��P��[�ފ���*dy���������:u+������=���-X���m՜���`��@����z�Ȁ�J��_�ڹk�{H{C7��4X�e�!���7�g��Ed
�W������� pU��3c��-5���c6{���U�o�[:MՎ.�.
�F@�K�ڂ�^�(�I����^O�]�^�	[�T���_�ӭKU01ۃcܲŏ�%x��$�!� C����o�m�z'�$��d�R�]݀�}2O�A(��Z���.���`�:1��0X@����AS�F>�.F���o���@����3���׺���S� k�xjq�|˙`��z�ȵ��j�sw��j#ݐ	;q}뚃za������k=J4H@A#'��t����-�GN^7U�:�r�9aݘf<to�bP���ϖfV��ԉ�:ׇ����g���(l9��e���j�N\;04�*Z
ꤵ;��r"'�]�u����	j7b������<޵&�e<ۭ������`�['�ݛ1ck7M��NZ��N�u¢��(�-;Y�]��5,�:a��5{l��.�m1㣏4w2{���S��؈������\�!59;М��B�#��z�T���DX {$c����&K�g�����ɟcp�o�;A].��	����8Ǝ�p@�ⱽ5¢������pL>L��R��?{�}�a^�왽�Ctי?�.��h,�)	[�3��� g2Ÿ���~����VW������������� ��,y�JX��c=�b�RtH��b���i�Z:0tf�Q���i-�)������9L(��f����    �$�`������#����3���ԣkU��9�:/�\��j����c�5�� �����P@��vC���Oo%.-v���.���`!��vY:�J ��+����ڪ�1�je#�B	������2�T�J�96�l!��l	�6�y�2�'�iI��<8���`��N�,��a�X>p"B��Ax�@$@Ӂ-TZ�4�,��I+w���j��<V����+Z�[���
"k�2��p\@9����<����� �|�'�Ha�������"ի�ؘD�6�`1-%Мٽ��Z��/����{}�,����$#� LJ�{Vw(�A�,V�?���&�āN��~'��T)����aa�������:To�_*��DZﴻ�
��U0	$��U�3��j@\��!p_]�>��d*�E�<b7WX���R{��od���wHnl�s� �����G̈���$`��~a\I������":J�,��8�����)�RE4�X��e*X�؀=ʬ��u9j���?`����g)�s�a��j��`TV�T{[C�s-��f��@��d	�NR
�� ��	a�2˿/��)t��"\a+m�yB���3��F,�V�OA�X�Sx]���d��:lwƺv��Q
�F�Ұ����˹�l���{�r���RRh��U=��F%��������W��'`��x���􇞇P�$��T��k��I��D��`��B��'��~���H�G �����C � r&,��Q ���yf�(�O���� �W��ؗc��1��՛F*ѕ4���+0K�I�w^KR'^�,�Q$ �L�3قPI�X��������ෲ՟�̕�o*8�D?�����,����OO���*A�t�{[3�U���pi�9<��E��T08�P0l2o�	H"�Dns�9t�3��0��"W.Ot���0M5S�Q�V����,"�	��S=-�S�r��An��	h� ���ա�IA*~�Db��L�=����+�l�	(�b�V��M�a怜,�ah�N�T��^i}JO����*� U!|��z�B�a��M�7|*v0GEw��o)���B��J3+��x�z����0�;����Tt���K���ꧣn�$h���4=��O���P7Y^�YK9=ϳSR�@���"9c�g�Տ�T��3�a�&��1��P6v�H�^n����*�</��0~�e(��8�.6'�as������əwzyS=����Z:0K���z�����K����N4t�C;R+�ໄ&��A5�S�5��O@5�0or�8�H@5-xW�*K�����f��6s�7��tp�`))(���Z��)��jA�4�^��L���A�b^E,?yn�T�z>w-�	�h\�I�joJg�����,�Q;QP2��y���$���"��/6�!!Rrm]^�#���T����0�|#�7s�sKq��>�)�ҭ���d��	"�g;����剔�zn��'���0�rn+����v��*�P�̍�y�fe{,uз\��pr.-���\:M�b������T9'*D�ߦ��L��j�q��b��z_.�:��Kz�ɤ� �Y��켤`�7�􏮛3�Sp�s�G�����`�7��f���,y�J����s �<ܺ�.g �9v�*��=$şC�b�c6m���5�3����p����iFuR���aF��φͤ������O��B�n�i����(fЬ?v1z>�������K�ҁ7�ϥۓ�m) ���N��z
�yC�8B�,-ݠ<�n^趴���a�ԧz�A0�ǐ��=����9�R����o�hC�W$�_/� ���r��ق�����,Q��۹E$"��V&1o�T�o��&�Nǂ\��`����� u�AP$K/ΙR�KB�F>+s�M��\�f>�үA�f�蓮� �(Ւ�]g��)���l2M�O#�����f:����S�򭔋�R>`k���I-��Hq��+�*�i'%p���rc��	A���ʝR�a&���ee��QIp�M��Q�����r�����6]x3,���U��N�1/��7}"�L�-������.(�'L�/R^�����.�˿H:��j�_�ѓ��Ԝ@�R����^WA9��x�!SN����)KA9�O�� �˒[𜯙��uL����N�2��~	Wx�x����_����,�jH��j�|l�W�.Rn6Z+�]���B�k���<��@9�=V�[RΟ����-�����	���r�$��y�!h��#ƴ,`�?�k9.q�g� M�.��!�.��H�\�4?�ɡ� �?��-h�Aޥ��M�$�9�y
�����"XL����WC�YH4?��[Y�^� ��r��{R^���q�(��������@0oM_���u���Ӡ���5�[]����V*�eq�"��ӝl�U9+.a��aʺr;o2��K�.P�������r��jji:y����X>���0ŃoS�
h&��j��"��/)���w.h&�g�Q���$�kd,4���4����)�����gi/u��l�.�LȦ�$#jeo�Z0w��k|G�� ��iV����7ZSH l��Y���],~u۝�F�V�K�.��;����TR�X���9%�=�6G��'��'�os4��!7��Z��9�+�j��vG���S�ޝe��!˘�)-��3mf�o��YY���r�T��BW�<�wk��'$ћ}}��F�.��_j��?4��3��-V�^����|^i�����׷��pyn�E��i!��}�_*��'w���z(�`��,����
�!mᭇ����K8���kY4Q���u��diMC�oA���7���G-�4$���d�X���4#�
�QL��d{/t��b��[�jVi��bG�NPK�-,$�<�e��P�
5���^I3����'����(�zr>�8���%�/X)�9.�~�(�-N����ʶ
Ύu��J�f�ѥ�$=��=)��P��2*���
����RL�ޙ�9�*fPR��9ɜ�G0]1.�OJ�9*B�}.o�9���RJ,�hdࢊ�<��kD�~����"��3��5��20P�]�Mx#���<5f�s䠜�t}9�߳���Bp:���w�|Avk���}���q���r����K� �#�p�@(�@q��W��3����A;���`Q�ER��;W��8���UXDU� �����ӌT�<`�h�%��{0f,a���>B�ʥv�ۻ��B�����@���Y9�20JA���@AJEv���͡�
ɱy��R �4�zߞ��B.^�z$V�;X�|=��Bc4�1��9e�7b%��ɨl/2��i�'�vL9����7�<0v#S�{���Piij�h��R�\)��U�����7b�@#-�{�f�=��UO�9�q�>�*&.1y~�Fj�+&�9�X�P��H8v0�\�A�Ά�XA�#}:Ϡ�;Iʐ#���f��]�JKF���c�-�^�8��aq꜁7ʽ`%�V?%��6� <g�K�w{�x r\��!�4�=ôK��(g�.�h;�2�ބ��d�@=8i�L܆��I	PǝA���{��_,�3]w�r0G�Q)e�2w�f�:VErE兠�����1H�4OW��(���m�Rr��ݽ����u��<ص��.}d҂z�tY�p�z5�gdr�J��#O���c�Yt��	��W��FD�s�ΓC�vz�j3� �t� �]���L�w�e���ɩfl��(�\�&��хV�|�גe�Qn��^��*�G�@���2m�b �Z3�/���:�,���-�ϛӖ~2�(���آѰ���ĉ��!w�lJ�漡�實_F��Xt��tvH˖�;�tsJSW����C��=�9�_�h���qߘ�@�6^V�Aw/�?%/�@/�o���A�K/�����cYܽ��Gm�59���eN����FB_����R)�����h�*�$�`�;yU��ߎ��`������s�@�� '  *-Űc�wVW::��}ռ*¸k���֛�,j�����.Z�!z[��)3O�b�BJ����~�2�NF�Tn?��bp�(�.Ē�d�X����x�㮭Ϊ��OB�# }c��r���^]�K`�;fw/ӑ�6�}�gO\K������ ����v)l [�uO�է�n�a�jp�]�T����䠍���s(b��}���t����A�+�b�t�+�b��v$$�+
Drw�,[��d��P�l`����堑R*-��*x)�pba��Ϯ��M�?�8�=��9X��h�\���%R�����<���f�A�8�ch�@+w<�s�la>f�p�6���#)[<����)8>$�/S�S"u_���z��ġ�\�D�X�8�D��q--Τ8A��Rh�#a���}K������k0����j8^ֶ������,�G+������,E�)	2��[��i*i&uo<��j��sR�Q.O����F�>VL�;�Ǚ߂�j��#W�Pw@�z���ي�`z����2�L�G^��<F��\7A�2'�a���Bɇ���r�XdN�9v�s���j���S_U;�u3�%B,sO^�X�� ҉!�D���I�9Y'�O�"�pq?('����/����s�Y�&l����$'�{x��1���`�ϳ��.J�"�)�Yd�23���d��t�iz^F8��qzz�'^\��|���7Vd��	@���;��}�Dˉc=N�	�*X��0o���JkÁA��w�VP�
�˩m�0@S+X�tU۽`i5b�s�� �$�F�T�Q��9&a�I_*H3	�	��I0=�|�!HI�p�d����Cg�S��*I��ez��9H�z~I���
2ͷ�i������k:a�U���"�}x��&�|c0ёy-MV��'fj�{P�c���`�V� .�9�3&��>W�n^��h35�� ü�2�4#q.@/���3�`��.`q�ռ��a�I�A/���� ǔr=��_)@0���o�@"��>�ك��3_I�Wk)@,�,�`'-�-�~q��s�y_M��ث ��Mv�Hd��@��`E� Q�\��n��r��PL����{;��2�`�C%��m��`�1/>�tc��%��
�9�B'7< /�+�����R �%O,{OI���`�ae����s�x����	�ЭY�(��ɭ�Ð�Q����'�:�Q0w�W\�ط�]r��2W>�9��=�+@C��[���"�ܢ�G�ʞ] �i�ƣ�/-�,�h>�>�Wd[���B|��P� @K4nr�Y����g�a<���8p)�6��p����W�M~q0�a��d�� A�9t��
��L�[����ǜA4�423�y[�a�P3�$]�Y�bB���g�����[�Pj̕;u�襔.R8�$e��W]uo�,�����y�.���1��4�$S�#�d!y*��P�i!���������<��EA90s���2ݭ��6RIb�3L#!�7q��5�����؅��>W�\����#�������#��r%���H���6F��s�0{x�R�V�}����<l0� ����O�I�N��[�S�m̫1�7�
wL�ɿM��@��ǅv�qbz���|B�w������R��\��m)�w���`��7�,���2��G����+ݬ䮬}�;<�(A%�=v���.H��|��ƃ�]`l��J����&���%��"������ԁb���$J�J�vǉ|�uY��7�X�Y��4'%�E����=�R���Lۄq7r�%�����"Q�p�)�z���9w]>�Ybo`��o��,*���k%h����tJ�y��$�Bu�/?����$����c�UK���ϫ�z8�6�}�"x�H����b�I=�O��-�P��C_��	K!�N��w�%��Gv׫���� ��e�3��܌���ݤ�.P	J��A[�)A(�+�3�%J������A��~��_�6�O�����Wu�xOu/,A#�e�n��-�!;�x�/~uyS%��j��I�i�����Ç��      V     x�M��j�0E�WSb�ΰ�[�@Rh�e7�z�Ed+Xr�����t!!ν<^�G):�;w�=��q4¶�Q��%�%$��*4��P�IV�I�.<���`��XjY���(M�����΃d�����C�Xx`��(޺��-��ǻ�:I�؊kvb�����Su$5vJ�@"K�$�2�E+|u����G�o�yn�9*r��I��鶅 �{��Ǟ����'f��AX�/�x�ʌv��_�S���~`��O�#      R   7   x�ȱ�0�����D1��p�
BIj�t(�ŃPM�ɾi���h�����      S   8   x���� ����&g�!���:b~m�X���#!'�ӷ���l^����/~��\�      J   �   x�E��
1E�7#M�nu%�k7q&8�պ��m-"	��$a0��&��q�IaCm.���b3J�oIC���C�-98��t��䄝Ε����՗�Yv��`*g���UR[�V�ԕy�!����W�k::/��q�)      K   +   x�3�4�4��#.#N#NSNd>H�(d�"���� V�&      Q   H   x����0�R1�$�B�u`�c���Px�u��b����Ct?����P4�(=f�:>�4��|����      O   L   x�3�44�4450�t,��4�2�44�r8�r3�R9���9�9�AB�E���\@@e �ļ�TN�=... -��      L   -   x�3�44���2�44��2�44�4�2�4	�r� y1z\\\ ���      P   �   x��=k�0 D�Sr��Z�.�4C�,B��k�$��U����	�!��b��G��5&������9z��-nѤ����CǾ<�%�mF�S�)lx.dط��	�z�:Q��DU���^Q5~�}C5�඄���jq�f.J�T�������\i����>?H���3}     