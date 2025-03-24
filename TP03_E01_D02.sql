CREATE TABLE IF NOT EXISTS CATALOGO_LIBRO (
	cod_catalogo int NOT NULL,
	titulo varchar(40) NOT NULL,
	formato varchar(40) NOT NULL,
	editorial varchar(40) NOT NULL,
	CONSTRAINT CATALOGO_LIBRO_pk0 PRIMARY KEY (cod_catalogo)
);

CREATE TABLE IF NOT EXISTS AUTOR_CATALOGO_LIBRO (
	cod_catalogo int NOT NULL,
	autor varchar(4) NOT NULL,
	CONSTRAINT AUTOR_CATALOGO_LIBRO_pk0 PRIMARY KEY (cod_catalogo),
    CONSTRAINT AUTOR_CATALOGO_LIBRO_pk1 PRIMARY KEY (autor)
);

CREATE TABLE IF NOT EXISTS EJEMPLAR_LIB (
	cod_catalogo int NOT NULL,
	nro_ejemplar int NOT NULL,
	anio_edicion int NOT NULL,
	nro_edicion int NOT NULL,
	CONSTRAINT EJEMPLAR_LIB_pk0 PRIMARY KEY (cod_catalogo),
    CONSTRAINT EJEMPLAR_LIB_pk1 PRIMARY KEY (nro_ejemplar)
);

CREATE TABLE IF NOT EXISTS PRESTAMO (
	id_prestamo int NOT NULL,
	id_usuario int NOT NULL,
	fecha_desde date NOT NULL,
	fecha_hasta date NOT NULL,
	CONSTRAINT PRESTAMO_pk0 PRIMARY KEY (id_prestamo)
);

CREATE TABLE IF NOT EXISTS LO_INTEGRAN (
	id_prestamo int NOT NULL,
	nro_ejemplar int NOT NULL,
	CONSTRAINT LO_INTEGRAN_pk0 PRIMARY KEY (id_prestamo),
    CONSTRAINT LO_INTEGRAN_pk1 PRIMARY KEY (nro_ejemplar)
);

CREATE TABLE IF NOT EXISTS USUARIO (
	id_usuario int NOT NULL,
	tipo_doc varchar(3) NOT NULL,
	nro_doc int NOT NULL,
	apellido varchar(43) NOT NULL,
	nombre varchar(43) NOT NULL,
	e_mal varchar(43) NOT NULL,
	tipo_usu int NOT NULL,
	CONSTRAINT USUARIO_pk0 PRIMARY KEY (id_usuario)
);

CREATE TABLE IF NOT EXISTS SIN_CARNET (
	id_usuario int NOT NULL,
	nro_celular int NOT NULL,
	CONSTRAINT SIN_CARNET_pk0 PRIMARY KEY (id_usuario)
);

CREATE TABLE IF NOT EXISTS CON_CARNET (
	id_usuario int NOT NULL,
	nro_carnet int NOT NULL,
	CONSTRAINT CON_CARNET_pk0 PRIMARY KEY (id_usuario)
);

ALTER TABLE AUTOR_CATALOGO_LIBRO ADD CONSTRAINT AUTOR_CATALOGO_LIBRO_fk0
    FOREIGN KEY (cod_catalogo) REFERENCES CATALOGO_LIBRO(cod_catalogo);

ALTER TABLE EJEMPLAR_LIB ADD CONSTRAINT EJEMPLAR_LIB_fk0
    FOREIGN KEY (cod_catalogo) REFERENCES CATALOGO_LIBRO(cod_catalogo);

ALTER TABLE PRESTAMO ADD CONSTRAINT PRESTAMO_fk1
    FOREIGN KEY (id_usuario) REFERENCES CON_CARNET(id_usuario);

ALTER TABLE LO_INTEGRAN ADD CONSTRAINT LO_INTEGRAN_fk0
    FOREIGN KEY (id_prestamo) REFERENCES PRESTAMO(id_prestamo);
ALTER TABLE LO_INTEGRAN ADD CONSTRAINT "LO_INTEGRAN_fk1"
    FOREIGN KEY (nro_ejemplar) REFERENCES EJEMPLAR_LIB(nro_ejemplar);

ALTER TABLE SIN_CARNET ADD CONSTRAINT SIN_CARNET_fk0
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario);

ALTER TABLE CON_CARNET ADD CONSTRAINT CON_CARNET_fk0
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario);
