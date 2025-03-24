-- tables
-- Table: DISCIPLINA
CREATE TABLE IF NOT EXISTS DISCIPLINA (
    id_disciplina int  NOT NULL,
    nombre_disciplina varchar(20)  NOT NULL,
    descripcion_disciplina varchar(120)  NOT NULL,
    CONSTRAINT DISCIPLINA_pk0 PRIMARY KEY (id_disciplina)
);

-- Table: INVESTIGADOR
CREATE TABLE IF NOT EXISTS INVESTIGADOR (
    id_investigador int  NOT NULL,
    tipo_doc char(3)  NOT NULL,
    nro_doc int  NOT NULL,
    nombre varchar(40)  NOT NULL,
    apellido varchar(40)  NOT NULL,
    direccion varchar(40)  NOT NULL,
    fecha_nac date  NOT NULL,
    id_disciplina int  NOT NULL,
    CONSTRAINT INVESTIGADOR_pk0 PRIMARY KEY (id_investigador)
);

-- Table: TELEFONO_INVESTIGADOR
CREATE TABLE IF NOT EXISTS TELEFONO_INVESTIGADOR (
    id_investigador int NOT NULL,
    telefono varchar(15)  NOT NULL,
    CONSTRAINT TELEFONO_INVESTIGADOR_pk0 PRIMARY KEY (id_investigador),
    CONSTRAINT TELEFONO_INVESTIGADOR_pk1 PRIMARY KEY (telefono)
);

-- Table: TAREA
CREATE TABLE IF NOT EXISTS TAREA (
    id_tarea int  NOT NULL,
    nombre_tarea varchar(15)  NOT NULL,
    cant_horas decimal(6,2)  NOT NULL,
    CONSTRAINT TAREA_pk0 PRIMARY KEY (id_tarea)
);

-- Table: SABE_REALIZAR
CREATE TABLE IF NOT EXISTS SABE_REALIZAR (
    id_investigador int  NOT NULL,
    id_tarea int  NOT NULL,
    CONSTRAINT SABE_REALIZAR_pk0 PRIMARY KEY (id_investigador),
    CONSTRAINT SABE_REALIZAR_pk1 PRIMARY KEY (id_tarea)
);

-- Table: PROYECTO
CREATE TABLE IF NOT EXISTS PROYECTO (
    cod_proyecto int  NOT NULL,
    nombre_proyecto varchar(40)  NOT NULL,
    monto decimal(10,2)  NOT NULL,
    estadio char(3)  NOT NULL,
    tipo_proy char(1)  NOT NULL,
    CONSTRAINT PROYECTO_pk0 PRIMARY KEY (cod_proyecto)
);

-- Table: PROY_INIC_FINAL
CREATE TABLE IF NOT EXISTS PROY_INIC_FINAL (
    fecha_inicio date  NOT NULL,
    fecha_fin date,
    cod_proyecto int  NOT NULL,
    id_investigador int  NOT NULL,
    CONSTRAINT PROY_INIC_FINAL_pk0 PRIMARY KEY (cod_proyecto)
);

-- Table: PROY_APROB_RECHAZ
CREATE TABLE IF NOT EXISTS PROY_APROB_RECHAZ (
    cod_proyecto int  NOT NULL,
    CONSTRAINT PROY_APROB_RECHAZ_pk0 PRIMARY KEY (cod_proyecto)
);

-- Modificaciones
ALTER TABLE INVESTIGADOR ADD CONSTRAINT INVESTIGADOR_fk0
    FOREIGN KEY (id_disciplina) REFERENCES DISCIPLINA(id_disciplina);

ALTER TABLE TELEFONO_INVESTIGADOR ADD CONSTRAINT TELEFONO_INVESTIGADOR_fk0
    FOREIGN KEY (id_investigador) REFERENCES INVESTIGADOR(id_investigador);

ALTER TABLE SABE_REALIZAR ADD CONSTRAINT SABE_REALIZAR_fk0
    FOREIGN KEY (id_investigador) REFERENCES INVESTIGADOR(id_investigador);
ALTER TABLE SABE_REALIZAR ADD CONSTRAINT SABE_REALIZAR_fk1
    FOREIGN KEY (id_tarea) REFERENCES TAREA(id_tarea);

ALTER TABLE PROY_INIC_FINAL ADD CONSTRAINT PROY_INIC_FINAL_fk0
    FOREIGN KEY (cod_proyecto) REFERENCES PROYECTO(cod_proyecto);
ALTER TABLE PROY_INIC_FINAL ADD CONSTRAINT PROY_INIC_FINAL_fk1
    FOREIGN KEY (id_investigador) REFERENCES INVESTIGADOR(id_investigador);

ALTER TABLE PROY_APROB_RECHAZ ADD CONSTRAINT PROY_APROB_RECHAZ_fk0
    FOREIGN KEY (cod_proyecto) REFERENCES PROYECTO(cod_proyecto);

-- End of file.
