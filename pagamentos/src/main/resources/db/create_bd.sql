CREATE DATABASE "alurafood-pagamento"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE SEQUENCE IF NOT EXISTS public.pagamentos_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.pagamentos_id_seq
    OWNER TO postgres;	
	
CREATE TABLE pagamentos (
 id bigint NOT NULL DEFAULT nextval('pagamentos_id_seq'::regclass),
 valor decimal(19,2) NOT NULL,
 nome varchar(100) DEFAULT NULL,
 numero varchar(19) DEFAULT NULL,
 expiracao varchar(7) NOT NULL,
 codigo varchar(3) DEFAULT NULL,
 status varchar(255) NOT NULL,
 forma_de_pagamento_id bigint NOT NULL,
 pedido_id bigint NOT NULL,
PRIMARY KEY (id)
);