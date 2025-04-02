-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-04-02 21:03:31.685

-- tables
-- Table: AUTOR_CATALOGO_LIBRO
CREATE TABLE AUTOR_CATALOGO_LIBRO (
    autor varchar(40)  NOT NULL,
    CATALOGO_LIBRO_cod_catalogo int  NOT NULL,
    CONSTRAINT AUTOR_CATALOGO_LIBRO_pk PRIMARY KEY (autor,CATALOGO_LIBRO_cod_catalogo)
);

-- Table: CATALOGO_LIBRO
CREATE TABLE CATALOGO_LIBRO (
    cod_catalogo int  NOT NULL,
    titulo varchar(40)  NOT NULL,
    formato varchar(40)  NOT NULL,
    editorial varchar(40)  NOT NULL,
    CONSTRAINT CATALOGO_LIBRO_pk PRIMARY KEY (cod_catalogo)
);

-- Table: CON_CARNET
CREATE TABLE CON_CARNET (
    nro_carnet int  NOT NULL,
    USUARIO_id_usuario int  NOT NULL,
    CONSTRAINT CON_CARNET_ak_1 UNIQUE (nro_carnet) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT CON_CARNET_pk PRIMARY KEY (USUARIO_id_usuario)
);

-- Table: EJEMPLAR_LIB
CREATE TABLE EJEMPLAR_LIB (
    nro_ejemplar int  NOT NULL,
    anio_edicion int  NOT NULL,
    nro_edicion int  NOT NULL,
    CATALOGO_LIBRO_cod_catalogo int  NOT NULL,
    CONSTRAINT EJEMPLAR_LIB_pk PRIMARY KEY (nro_ejemplar)
);

-- Table: LO_INTEGRAN
CREATE TABLE LO_INTEGRAN (
    PRESTAMO_id_prestamo int  NOT NULL,
    EJEMPLAR_LIB_nro_ejemplar int  NOT NULL,
    CONSTRAINT LO_INTEGRAN_pk PRIMARY KEY (PRESTAMO_id_prestamo,EJEMPLAR_LIB_nro_ejemplar)
);

-- Table: PRESTAMO
CREATE TABLE PRESTAMO (
    id_prestamo int  NOT NULL,
    fecha_desde date  NOT NULL,
    fecha_hasta date  NOT NULL,
    CON_CARNET_USUARIO_id_usuario int  NOT NULL,
    CONSTRAINT PRESTAMO_pk PRIMARY KEY (id_prestamo)
);

-- Table: Sin_CARNET
CREATE TABLE Sin_CARNET (
    nro_celular bigint  NOT NULL,
    USUARIO_id_usuario int  NOT NULL,
    CONSTRAINT Sin_CARNET_pk PRIMARY KEY (USUARIO_id_usuario)
);

-- Table: USUARIO
CREATE TABLE USUARIO (
    id_usuario int  NOT NULL,
    tipo_doc varchar(3)  NOT NULL,
    nro_doc int  NOT NULL,
    apellido varchar(40)  NOT NULL,
    nombre varchar(40)  NOT NULL,
    e_mail varchar(40)  NOT NULL,
    tipo_usu varchar(1)  NOT NULL,
    CONSTRAINT USUARIO_ak_1 UNIQUE (tipo_doc) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT USUARIO_ak_2 UNIQUE (nro_doc) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT USUARIO_pk PRIMARY KEY (id_usuario)
);

-- foreign keys
-- Reference: AUTOR_CATALOGO_LIBRO_CATALOGO_LIBRO (table: AUTOR_CATALOGO_LIBRO)
ALTER TABLE AUTOR_CATALOGO_LIBRO ADD CONSTRAINT AUTOR_CATALOGO_LIBRO_CATALOGO_LIBRO
    FOREIGN KEY (CATALOGO_LIBRO_cod_catalogo)
    REFERENCES CATALOGO_LIBRO (cod_catalogo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: CON_CARNET_USUARIO (table: CON_CARNET)
ALTER TABLE CON_CARNET ADD CONSTRAINT CON_CARNET_USUARIO
    FOREIGN KEY (USUARIO_id_usuario)
    REFERENCES USUARIO (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: EJEMPLAR_LIB_CATALOGO_LIBRO (table: EJEMPLAR_LIB)
ALTER TABLE EJEMPLAR_LIB ADD CONSTRAINT EJEMPLAR_LIB_CATALOGO_LIBRO
    FOREIGN KEY (CATALOGO_LIBRO_cod_catalogo)
    REFERENCES CATALOGO_LIBRO (cod_catalogo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: LO_INTEGRAN_EJEMPLAR_LIB (table: LO_INTEGRAN)
ALTER TABLE LO_INTEGRAN ADD CONSTRAINT LO_INTEGRAN_EJEMPLAR_LIB
    FOREIGN KEY (EJEMPLAR_LIB_nro_ejemplar)
    REFERENCES EJEMPLAR_LIB (nro_ejemplar)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: LO_INTEGRAN_PRESTAMO (table: LO_INTEGRAN)
ALTER TABLE LO_INTEGRAN ADD CONSTRAINT LO_INTEGRAN_PRESTAMO
    FOREIGN KEY (PRESTAMO_id_prestamo)
    REFERENCES PRESTAMO (id_prestamo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PRESTAMO_CON_CARNET (table: PRESTAMO)
ALTER TABLE PRESTAMO ADD CONSTRAINT PRESTAMO_CON_CARNET
    FOREIGN KEY (CON_CARNET_USUARIO_id_usuario)
    REFERENCES CON_CARNET (USUARIO_id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Sin_CARNET_USUARIO (table: Sin_CARNET)
ALTER TABLE Sin_CARNET ADD CONSTRAINT Sin_CARNET_USUARIO
    FOREIGN KEY (USUARIO_id_usuario)
    REFERENCES USUARIO (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.
