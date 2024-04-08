CREATE DATABASE "alurafood-pedidos"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE SEQUENCE IF NOT EXISTS public.pedido_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.pedido_id_seq
    OWNER TO postgres;	
	
CREATE SEQUENCE IF NOT EXISTS public.item_pedido_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.item_pedido_id_seq
    OWNER TO postgres;	
	
	
CREATE TABLE pedidos (
  id bigint NOT NULL DEFAULT nextval('pedido_id_seq'::regclass),
  data_hora "timestamp" NOT NULL,
  status varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE item_do_pedido (
  id bigint NOT NULL DEFAULT nextval('item_pedido_id_seq'::regclass),
  descricao varchar(255) DEFAULT NULL,
  quantidade int NOT NULL,
  pedido_id bigint NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
)