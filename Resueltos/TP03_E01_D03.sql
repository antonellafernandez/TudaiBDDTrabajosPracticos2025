--
CREATE TABLE IF NOT EXISTS CLIENTE (
	id_cliente int NOT NULL,
	garante int,
	CUIT bigint NOT NULL,
	apellido varchar(40) NOT NULL,
	nombre varchar(40) NOT NULL,
	calle varchar(40) NOT NULL,
    puerta int NOT NULL,
	piso int NOT NULL,
	e_mail varchar(40),
	telefono bigint NOT NULL,
	CONSTRAINT CLIENTE_pk PRIMARY KEY (id_cliente),
    CONSTRAINT CLIENTE_ak0 UNIQUE (CUIT) NOT DEFERRABLE INITIALLY IMMEDIATE
);

CREATE TABLE IF NOT EXISTS ENVIO (
	nro_envio int NOT NULL,
	id_cliente int NOT NULL,
	id_prod_quim int NOT NULL,
	cantidad int NOT NULL,
	peso int NOT NULL,
	CONSTRAINT ENVIO_pk PRIMARY KEY (nro_envio)
);

CREATE TABLE IF NOT EXISTS PRODUCTO_QUIMICO (
	id_prod_quim int NOT NULL,
	nombre_prod_quim varchar(40) NOT NULL,
	formula varchar(40) NOT NULL,
	tipo_pq varchar(1) NOT NULL,
	CONSTRAINT PRODUCTO_QUIMICO_pk PRIMARY KEY (id_prod_quim)
);

CREATE TABLE IF NOT EXISTS COMPUESTO_QUIMICO (
	id_prod_quim int NOT NULL,
	id_comp_quim int NOT NULL,
    porcentaje int NOT NULL,
	CONSTRAINT COMPUESTO_QUIMICO_pk PRIMARY KEY (id_prod_quim, id_comp_quim)
);

CREATE TABLE IF NOT EXISTS PQ_LIQUIDO (
	id_prod_quim int NOT NULL,
	inflamable boolean NOT NULL,
	tipo_envase varchar(40) NOT NULL,
    cond_traslado varchar(40),
	CONSTRAINT PQ_LIQUIDO_pk PRIMARY KEY (id_prod_quim)
);

CREATE TABLE IF NOT EXISTS PQ_SOLIDO (
	id_prod_quim int NOT NULL,
	forma varchar(40) NOT NULL,
	empaque_max varchar(40) NOT NULL,
	CONSTRAINT PQ_SOLIDO_pk PRIMARY KEY (id_prod_quim)
);

--
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_fk1
    FOREIGN KEY (garante)
    REFERENCES CLIENTE(id_cliente)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE;

ALTER TABLE ENVIO ADD CONSTRAINT ENVIO_fk1
    FOREIGN KEY (id_cliente)
    REFERENCES CLIENTE(id_cliente)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE;
ALTER TABLE ENVIO ADD CONSTRAINT ENVIO_fk2
    FOREIGN KEY (id_prod_quim)
    REFERENCES PRODUCTO_QUIMICO(id_prod_quim)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE;

ALTER TABLE COMPUESTO_QUIMICO ADD CONSTRAINT COMPUESTO_QUIMICO_fk0
    FOREIGN KEY (id_prod_quim)
    REFERENCES PRODUCTO_QUIMICO(id_prod_quim)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE;
ALTER TABLE COMPUESTO_QUIMICO ADD CONSTRAINT COMPUESTO_QUIMICO_fk1
    FOREIGN KEY (id_comp_quim)
    REFERENCES PRODUCTO_QUIMICO(id_prod_quim)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE;

ALTER TABLE PQ_LIQUIDO ADD CONSTRAINT PQ_LIQUIDO_fk
    FOREIGN KEY (id_prod_quim)
    REFERENCES PRODUCTO_QUIMICO(id_prod_quim)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE;

ALTER TABLE PQ_SOLIDO ADD CONSTRAINT PQ_SOLIDO_fk
    FOREIGN KEY (id_prod_quim)
    REFERENCES PRODUCTO_QUIMICO(id_prod_quim)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE;
