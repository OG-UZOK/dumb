--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-06-22 20:45:10 +07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 24628)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 3685 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 24647)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24676)
-- Name: dishes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dishes (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    date date NOT NULL,
    user_id uuid,
    calories integer NOT NULL,
    proteins integer NOT NULL,
    fats integer NOT NULL,
    carbohydrates integer NOT NULL,
    amountportion integer NOT NULL,
    cookingtime integer NOT NULL
);


ALTER TABLE public.dishes OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24699)
-- Name: dishes_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dishes_categories (
    dish_id uuid,
    category_id uuid
);


ALTER TABLE public.dishes_categories OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24712)
-- Name: dishes_ingridients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dishes_ingridients (
    ingridient_id uuid NOT NULL,
    dish_id uuid NOT NULL,
    amount real NOT NULL,
    unit character varying(255) NOT NULL,
    id uuid NOT NULL,
    gramm integer NOT NULL
);


ALTER TABLE public.dishes_ingridients OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24727)
-- Name: dishes_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dishes_tags (
    dish_id uuid NOT NULL,
    tag_id uuid NOT NULL
);


ALTER TABLE public.dishes_tags OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24653)
-- Name: ingridients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingridients (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    is_liquid boolean,
    name character varying(255) NOT NULL,
    protein real NOT NULL,
    fat real NOT NULL,
    carbohydrates real NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.ingridients OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24687)
-- Name: physiological_characteristics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.physiological_characteristics (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    gender character varying(255) NOT NULL,
    age integer NOT NULL,
    height integer NOT NULL,
    weight integer NOT NULL,
    daily_activity character varying(255) NOT NULL,
    target character varying(255) NOT NULL,
    body_mass_index real NOT NULL,
    calories integer NOT NULL,
    proteins real NOT NULL,
    fats real NOT NULL,
    carbohydrates real NOT NULL
);


ALTER TABLE public.physiological_characteristics OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24670)
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24664)
-- Name: type_of_meal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_of_meal (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.type_of_meal OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24740)
-- Name: type_of_meal_dishes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_of_meal_dishes (
    type_of_meal_id uuid NOT NULL,
    dish_id uuid NOT NULL
);


ALTER TABLE public.type_of_meal_dishes OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24639)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    role character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3670 (class 0 OID 24647)
-- Dependencies: 217
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories (id, name) VALUES ('9305fe49-029f-4659-b198-ebdb8e670b40', 'Первые блюда');
INSERT INTO public.categories (id, name) VALUES ('f7bd3b60-b27f-4c45-a50d-aea968ec055a', 'Вторые блюда');
INSERT INTO public.categories (id, name) VALUES ('dd65ae0a-84f5-440c-b071-f412a83ef4d7', 'Салаты');
INSERT INTO public.categories (id, name) VALUES ('f0f52882-8415-40b6-a5a6-15fcb0db6858', 'Закуски');
INSERT INTO public.categories (id, name) VALUES ('37e7b790-f73f-4f3a-9aa5-caa78b39588e', 'Выпечка');
INSERT INTO public.categories (id, name) VALUES ('bf68ae6e-e8cb-48a0-8afb-6b96f0b7fe68', 'Соусы и маринады');
INSERT INTO public.categories (id, name) VALUES ('298d51a8-fa70-4b5a-9a86-1a9346e77a48', 'Заготовки');
INSERT INTO public.categories (id, name) VALUES ('51f5a690-f384-4a03-be60-26e54b737cf6', 'Напитки');
INSERT INTO public.categories (id, name) VALUES ('2ab7ab96-707f-4481-9896-fc836c1099e5', 'Десерты');
INSERT INTO public.categories (id, name) VALUES ('fd1687e7-185f-4f63-8d47-9bc8cbb868c8', 'Гарниры');


--
-- TOC entry 3674 (class 0 OID 24676)
-- Dependencies: 221
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dishes (id, name, date, user_id, calories, proteins, fats, carbohydrates, amountportion, cookingtime) VALUES ('cab89d17-a89e-477a-a3f3-e53860bb1835', 'adfgsf', '2024-06-20', '78660791-4b10-4077-9bae-a414f7ea0c0e', 207, 36, 3, 9, 5, 45);
INSERT INTO public.dishes (id, name, date, user_id, calories, proteins, fats, carbohydrates, amountportion, cookingtime) VALUES ('23e16ece-f8b5-4ebb-9ebd-c2c0aeebac8f', 'adfgsf', '2024-06-20', '78660791-4b10-4077-9bae-a414f7ea0c0e', 207, 36, 3, 9, 5, 45);
INSERT INTO public.dishes (id, name, date, user_id, calories, proteins, fats, carbohydrates, amountportion, cookingtime) VALUES ('a70dbdf4-8a0f-4ca8-9a85-7c771715f2cf', 'adfgsf', '2024-06-22', '78660791-4b10-4077-9bae-a414f7ea0c0e', 0, 0, 0, 0, 5, 45);


--
-- TOC entry 3676 (class 0 OID 24699)
-- Dependencies: 223
-- Data for Name: dishes_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3677 (class 0 OID 24712)
-- Dependencies: 224
-- Data for Name: dishes_ingridients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dishes_ingridients (ingridient_id, dish_id, amount, unit, id, gramm) VALUES ('c5eb22f8-cb1e-446e-9844-0d31ed0c5364', 'cab89d17-a89e-477a-a3f3-e53860bb1835', 1, 'kg', '630f5f04-f96c-41ab-bbfa-911b60e9462d', 1);


--
-- TOC entry 3678 (class 0 OID 24727)
-- Dependencies: 225
-- Data for Name: dishes_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3671 (class 0 OID 24653)
-- Dependencies: 218
-- Data for Name: ingridients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ingridients (id, is_liquid, name, protein, fat, carbohydrates, user_id) VALUES ('c5eb22f8-cb1e-446e-9844-0d31ed0c5364', false, 'banan', 20, 9, 30, 'dab557d4-0c3d-47eb-a19a-b6f414a67830');


--
-- TOC entry 3675 (class 0 OID 24687)
-- Dependencies: 222
-- Data for Name: physiological_characteristics; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.physiological_characteristics (id, user_id, gender, age, height, weight, daily_activity, target, body_mass_index, calories, proteins, fats, carbohydrates) VALUES ('fae7ce3a-3e31-45ac-83a8-1dcc63c00af6', '78660791-4b10-4077-9bae-a414f7ea0c0e', 'Male', 22, 190, 67, 'Низкая', 'Набрать вес', 18.6, 2771, 173.19, 67.74, 367.16);


--
-- TOC entry 3673 (class 0 OID 24670)
-- Dependencies: 220
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tags (id, name) VALUES ('32bb3ea7-d836-4926-a545-8b0667117419', 'fruit');
INSERT INTO public.tags (id, name) VALUES ('626f7e0a-90d0-43da-b781-1354c127b744', 'post');


--
-- TOC entry 3672 (class 0 OID 24664)
-- Dependencies: 219
-- Data for Name: type_of_meal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.type_of_meal (id, name) VALUES ('08759405-cb6d-4aec-ae21-eb11316cce61', 'Завтрак');
INSERT INTO public.type_of_meal (id, name) VALUES ('3750f7e5-1959-43ef-bd48-161e13849588', 'Обед');
INSERT INTO public.type_of_meal (id, name) VALUES ('3ea917e8-fee4-4ca5-823a-1b2bed253368', 'Подник');
INSERT INTO public.type_of_meal (id, name) VALUES ('660a0083-e4fa-4caf-8f55-fb26aa4f4267', 'Ужин');
INSERT INTO public.type_of_meal (id, name) VALUES ('31d25dd9-b29c-4332-9652-de4f93046177', 'Перекус');


--
-- TOC entry 3679 (class 0 OID 24740)
-- Dependencies: 226
-- Data for Name: type_of_meal_dishes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.type_of_meal_dishes (type_of_meal_id, dish_id) VALUES ('660a0083-e4fa-4caf-8f55-fb26aa4f4267', 'cab89d17-a89e-477a-a3f3-e53860bb1835');


--
-- TOC entry 3669 (class 0 OID 24639)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, name, surname, password, email, role) VALUES ('78660791-4b10-4077-9bae-a414f7ea0c0e', 'Arthur', 'Isahanian', '$2a$10$PBYpaE7UwrCiDDxGQ5wsg.Dpma1Zi/t9qdlTKEuWnxeDbd1ULgQm6', 'karla-an@mail.ru', 'ROLE_USER');
INSERT INTO public.users (id, name, surname, password, email, role) VALUES ('dab557d4-0c3d-47eb-a19a-b6f414a67830', 'Arthur', 'Isahanian', '$2a$10$.p4RAMNO650HMbpZNrYeYeG5oSf.RsqyiSBPTouz7O/FYQShUy39m', 'karlaan@mail.ru', 'ADMIN');


--
-- TOC entry 3502 (class 2606 OID 24652)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3514 (class 2606 OID 24716)
-- Name: dishes_ingridients dishes_ingridients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_ingridients
    ADD CONSTRAINT dishes_ingridients_pkey PRIMARY KEY (id);


--
-- TOC entry 3510 (class 2606 OID 24681)
-- Name: dishes dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (id);


--
-- TOC entry 3504 (class 2606 OID 24658)
-- Name: ingridients ingridients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingridients
    ADD CONSTRAINT ingridients_pkey PRIMARY KEY (id);


--
-- TOC entry 3512 (class 2606 OID 24693)
-- Name: physiological_characteristics physiological_characteristics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physiological_characteristics
    ADD CONSTRAINT physiological_characteristics_pkey PRIMARY KEY (id);


--
-- TOC entry 3508 (class 2606 OID 24675)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 3506 (class 2606 OID 24669)
-- Name: type_of_meal type_of_meal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_of_meal
    ADD CONSTRAINT type_of_meal_pkey PRIMARY KEY (id);


--
-- TOC entry 3500 (class 2606 OID 24646)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3518 (class 2606 OID 24707)
-- Name: dishes_categories dishes_categories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_categories
    ADD CONSTRAINT dishes_categories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 3519 (class 2606 OID 24702)
-- Name: dishes_categories dishes_categories_dish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_categories
    ADD CONSTRAINT dishes_categories_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dishes(id);


--
-- TOC entry 3520 (class 2606 OID 24722)
-- Name: dishes_ingridients dishes_ingridients_dish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_ingridients
    ADD CONSTRAINT dishes_ingridients_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dishes(id);


--
-- TOC entry 3521 (class 2606 OID 24717)
-- Name: dishes_ingridients dishes_ingridients_ingridient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_ingridients
    ADD CONSTRAINT dishes_ingridients_ingridient_id_fkey FOREIGN KEY (ingridient_id) REFERENCES public.ingridients(id);


--
-- TOC entry 3522 (class 2606 OID 24730)
-- Name: dishes_tags dishes_tags_dish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_tags
    ADD CONSTRAINT dishes_tags_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dishes(id);


--
-- TOC entry 3523 (class 2606 OID 24735)
-- Name: dishes_tags dishes_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_tags
    ADD CONSTRAINT dishes_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- TOC entry 3516 (class 2606 OID 24682)
-- Name: dishes dishes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3515 (class 2606 OID 24659)
-- Name: ingridients ingridients_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingridients
    ADD CONSTRAINT ingridients_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3517 (class 2606 OID 24694)
-- Name: physiological_characteristics physiological_characteristics_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physiological_characteristics
    ADD CONSTRAINT physiological_characteristics_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3524 (class 2606 OID 24748)
-- Name: type_of_meal_dishes type_of_meal_dishes_dish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_of_meal_dishes
    ADD CONSTRAINT type_of_meal_dishes_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dishes(id);


--
-- TOC entry 3525 (class 2606 OID 24743)
-- Name: type_of_meal_dishes type_of_meal_dishes_type_of_meal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_of_meal_dishes
    ADD CONSTRAINT type_of_meal_dishes_type_of_meal_id_fkey FOREIGN KEY (type_of_meal_id) REFERENCES public.type_of_meal(id);


-- Completed on 2024-06-22 20:45:10 +07

--
-- PostgreSQL database dump complete
--

