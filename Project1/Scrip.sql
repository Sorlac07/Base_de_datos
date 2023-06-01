-- Query 1 - creacion de tablas
--  Descripcion: Se crean todas las tablas para el proyecto
--	Fecha: 31/05/2023
--	Autor: Grupo 2

CREATE DATABASE TechDevps;

USE TechDevps;
-- tables
-- Table: Carrera

CREATE TABLE Carrera (
    ID_Carrera int  NOT NULL,
    Nom_Carrera nvarchar(30)  NOT NULL,
    CONSTRAINT Carrera_pk PRIMARY KEY  (ID_Carrera)
);

-- Table: Curriculum_Carrera
CREATE TABLE Curriculum_Carrera (
    ID_Curriculum int  NOT NULL,
    ID_Carrera int  NOT NULL,
    CONSTRAINT Curriculum_Carrera_pk PRIMARY KEY  (ID_Curriculum,ID_Carrera)
);

-- Table: Curriculum_Fortaleza
CREATE TABLE Curriculum_Fortaleza (
    ID_Curriculum int  NOT NULL,
    ID_Fortaleza int  NOT NULL,
    CONSTRAINT Curriculum_Fortaleza_pk PRIMARY KEY  (ID_Curriculum,ID_Fortaleza)
);

-- Table: Curriculum_Hab_Tec
CREATE TABLE Curriculum_Hab_Tec (
    ID_Curriculum int  NOT NULL,
    ID_Hab_Tec int  NOT NULL,
    Nivel_Hab_Tec nvarchar(20)  NOT NULL,
    CONSTRAINT Curriculum_Hab_Tec_pk PRIMARY KEY  (ID_Curriculum,ID_Hab_Tec)
);

-- Table: Curriculum_Idiomas
CREATE TABLE Curriculum_Idiomas (
    ID_Curriculum int  NOT NULL,
    Idioma_ID_Idioma int  NOT NULL,
    Nivel_Idioma nvarchar(20)  NOT NULL,
    CONSTRAINT Curriculum_Idiomas_pk PRIMARY KEY  (ID_Curriculum,Idioma_ID_Idioma)
);

-- Table: Curriculum_Institucion
CREATE TABLE Curriculum_Institucion (
    ID_Institucion int  NOT NULL,
    ID_Curriculum int  NOT NULL,
    CONSTRAINT Curriculum_Institucion_pk PRIMARY KEY  (ID_Institucion,ID_Curriculum)
);

-- Table: Curriculum_Usuario
CREATE TABLE Curriculum_Usuario (
    ID_Curriculum int  NOT NULL,
    Fecha_Crea_CV date  NOT NULL,
    Fecha_Mod_CV date  NOT NULL,
    ID_Usuario int  NOT NULL,
    CONSTRAINT Curriculum_Usuario_pk PRIMARY KEY  (ID_Curriculum)
);

-- Table: Entrevista_Preguntas
CREATE TABLE Entrevista_Preguntas (
    ID_Sim_Ent int  NOT NULL,
    ID_Pregunta int  NOT NULL,
    CONSTRAINT Entrevista_Preguntas_pk PRIMARY KEY  (ID_Sim_Ent,ID_Pregunta)
);

-- Table: Evaluacion_Entrevista
CREATE TABLE Evaluacion_Entrevista (
    ID_Eval_Ent int  NOT NULL,
    Calif_Eval int  NOT NULL,
    Coment_eval nvarchar(300)  NOT NULL,
    ID_Sim_Ent int  NOT NULL,
    CONSTRAINT Evaluacion_Entrevista_pk PRIMARY KEY  (ID_Eval_Ent)
);

-- Table: Fortaleza
CREATE TABLE Fortaleza (
    ID_Fortaleza int  NOT NULL,
    Nom_Fortaleza nvarchar(20)  NOT NULL,
    CONSTRAINT Fortaleza_pk PRIMARY KEY  (ID_Fortaleza)
);

-- Table: Grabacion_Simulacion
CREATE TABLE Grabacion_Simulacion (
    ID_Grabacion int  NOT NULL,
    Min_Duracion int  NOT NULL,
    ID_Sim_Ent int  NOT NULL,
    CONSTRAINT Grabacion_Simulacion_pk PRIMARY KEY  (ID_Grabacion)
);

-- Table: Habilidad_Tecnica
CREATE TABLE Habilidad_Tecnica (
    ID_Hab_Tec int  NOT NULL,
    Nom_Hab_Tec nvarchar(20)  NOT NULL,
    CONSTRAINT Habilidad_Tecnica_pk PRIMARY KEY  (ID_Hab_Tec)
);

-- Table: Idioma
CREATE TABLE Idioma (
    ID_Idioma int  NOT NULL,
    Nom_Idioma nvarchar(20)  NOT NULL,
    CONSTRAINT Idioma_pk PRIMARY KEY  (ID_Idioma)
);

-- Table: Institucion
CREATE TABLE Institucion (
    ID_Institucion int  NOT NULL,
    Nom_Institucion nvarchar(40)  NOT NULL,
    CONSTRAINT Institucion_pk PRIMARY KEY  (ID_Institucion)
);

-- Table: Login
CREATE TABLE Login (
    Usuario nvarchar(20)  NOT NULL,
    Clave nvarchar(20)  NOT NULL,
    ID_Usuario int  NOT NULL,
    CONSTRAINT Login_pk PRIMARY KEY  (Usuario)
);

-- Table: Membresia
CREATE TABLE Membresia (
    ID_Membresia int  NOT NULL,
    Nom_Membresia nvarchar(20)  NOT NULL,
    Precio money  NOT NULL,
    CONSTRAINT Membresia_pk PRIMARY KEY  (ID_Membresia)
);

-- Table: Membresia_Usuario
CREATE TABLE Membresia_Usuario (
    ID_Usuario int  NOT NULL,
    ID_Membresia int  NOT NULL,
    Fec_Afil date  NOT NULL,
    Fec_Ven date  NOT NULL,
    CONSTRAINT Membresia_Usuario_pk PRIMARY KEY  (ID_Membresia,ID_Usuario)
);

-- Table: Pregunta
CREATE TABLE Pregunta (
    ID_Pregunta int  NOT NULL,
    Enunciado nvarchar(100)  NOT NULL,
    CONSTRAINT Pregunta_pk PRIMARY KEY  (ID_Pregunta)
);

-- Table: Simulacion_Entrevista
CREATE TABLE Simulacion_Entrevista (
    ID_Sim_Ent int  NOT NULL,
    Fecha_Sim date  NOT NULL,
    Hora_Inicio time  NOT NULL,
    Hora_Final time  NOT NULL,
    ID_Usuario int  NOT NULL,
    CONSTRAINT Simulacion_Entrevista_pk PRIMARY KEY  (ID_Sim_Ent)
);

-- Table: Usuario
CREATE TABLE Usuario (
    ID_Usuario int  NOT NULL,
    Nombre nvarchar(20)  NOT NULL,
    Ape_Pat nvarchar(20)  NOT NULL,
    Ape_Mat nvarchar(20)  NOT NULL,
    Edad int  NOT NULL,
    Correo nvarchar(50)  NOT NULL,
    Fec_Nac date  NOT NULL,
    Num_Cel nvarchar(15)  NOT NULL,
    CONSTRAINT Usuario_pk PRIMARY KEY  (ID_Usuario)
);

-- foreign keys
-- Reference: Curriculum_Carrera_Carrera (table: Curriculum_Carrera)
ALTER TABLE Curriculum_Carrera ADD CONSTRAINT Curriculum_Carrera_Carrera
    FOREIGN KEY (ID_Carrera)
    REFERENCES Carrera (ID_Carrera);

-- Reference: Curriculum_Carrera_Curriculum_Usuario (table: Curriculum_Carrera)
ALTER TABLE Curriculum_Carrera ADD CONSTRAINT Curriculum_Carrera_Curriculum_Usuario
    FOREIGN KEY (ID_Curriculum)
    REFERENCES Curriculum_Usuario (ID_Curriculum);

-- Reference: Curriculum_Fortaleza_Curriculum_Usuario (table: Curriculum_Fortaleza)
ALTER TABLE Curriculum_Fortaleza ADD CONSTRAINT Curriculum_Fortaleza_Curriculum_Usuario
    FOREIGN KEY (ID_Curriculum)
    REFERENCES Curriculum_Usuario (ID_Curriculum);

-- Reference: Curriculum_Fortaleza_Fortaleza (table: Curriculum_Fortaleza)
ALTER TABLE Curriculum_Fortaleza ADD CONSTRAINT Curriculum_Fortaleza_Fortaleza
    FOREIGN KEY (ID_Fortaleza)
    REFERENCES Fortaleza (ID_Fortaleza);

-- Reference: Curriculum_Hab_Tec_Curriculum_Usuario (table: Curriculum_Hab_Tec)
ALTER TABLE Curriculum_Hab_Tec ADD CONSTRAINT Curriculum_Hab_Tec_Curriculum_Usuario
    FOREIGN KEY (ID_Curriculum)
    REFERENCES Curriculum_Usuario (ID_Curriculum);

-- Reference: Curriculum_Hab_Tec_Habilidad_Tecnica (table: Curriculum_Hab_Tec)
ALTER TABLE Curriculum_Hab_Tec ADD CONSTRAINT Curriculum_Hab_Tec_Habilidad_Tecnica
    FOREIGN KEY (ID_Hab_Tec)
    REFERENCES Habilidad_Tecnica (ID_Hab_Tec);

-- Reference: Curriculum_Idiomas_Curriculum_Usuario (table: Curriculum_Idiomas)
ALTER TABLE Curriculum_Idiomas ADD CONSTRAINT Curriculum_Idiomas_Curriculum_Usuario
    FOREIGN KEY (ID_Curriculum)
    REFERENCES Curriculum_Usuario (ID_Curriculum);

-- Reference: Curriculum_Idiomas_Idioma (table: Curriculum_Idiomas)
ALTER TABLE Curriculum_Idiomas ADD CONSTRAINT Curriculum_Idiomas_Idioma
    FOREIGN KEY (Idioma_ID_Idioma)
    REFERENCES Idioma (ID_Idioma);

-- Reference: Curriculum_Institucion_Curriculum_Usuario (table: Curriculum_Institucion)
ALTER TABLE Curriculum_Institucion ADD CONSTRAINT Curriculum_Institucion_Curriculum_Usuario
    FOREIGN KEY (ID_Curriculum)
    REFERENCES Curriculum_Usuario (ID_Curriculum);

-- Reference: Curriculum_Institucion_Institucion (table: Curriculum_Institucion)
ALTER TABLE Curriculum_Institucion ADD CONSTRAINT Curriculum_Institucion_Institucion
    FOREIGN KEY (ID_Institucion)
    REFERENCES Institucion (ID_Institucion);

-- Reference: Curriculum_Usuario_Usuario (table: Curriculum_Usuario)
ALTER TABLE Curriculum_Usuario ADD CONSTRAINT Curriculum_Usuario_Usuario
    FOREIGN KEY (ID_Usuario)
    REFERENCES Usuario (ID_Usuario);

-- Reference: Entrevista_Preguntas_Pregunta (table: Entrevista_Preguntas)
ALTER TABLE Entrevista_Preguntas ADD CONSTRAINT Entrevista_Preguntas_Pregunta
    FOREIGN KEY (ID_Pregunta)
    REFERENCES Pregunta (ID_Pregunta);

-- Reference: Entrevista_Preguntas_Simulacion_Entrevista (table: Entrevista_Preguntas)
ALTER TABLE Entrevista_Preguntas ADD CONSTRAINT Entrevista_Preguntas_Simulacion_Entrevista
    FOREIGN KEY (ID_Sim_Ent)
    REFERENCES Simulacion_Entrevista (ID_Sim_Ent);

-- Reference: Evaluacion_Entrevista_Simulacion_Entrevista (table: Evaluacion_Entrevista)
ALTER TABLE Evaluacion_Entrevista ADD CONSTRAINT Evaluacion_Entrevista_Simulacion_Entrevista
    FOREIGN KEY (ID_Sim_Ent)
    REFERENCES Simulacion_Entrevista (ID_Sim_Ent);

-- Reference: Grabacion_Simulacion_Simulacion_Entrevista (table: Grabacion_Simulacion)
ALTER TABLE Grabacion_Simulacion ADD CONSTRAINT Grabacion_Simulacion_Simulacion_Entrevista
    FOREIGN KEY (ID_Sim_Ent)
    REFERENCES Simulacion_Entrevista (ID_Sim_Ent);

-- Reference: Login_Usuario (table: Login)
ALTER TABLE Login ADD CONSTRAINT Login_Usuario
    FOREIGN KEY (ID_Usuario)
    REFERENCES Usuario (ID_Usuario);

-- Reference: Membresia_Usuario_Membresia (table: Membresia_Usuario)
ALTER TABLE Membresia_Usuario ADD CONSTRAINT Membresia_Usuario_Membresia
    FOREIGN KEY (ID_Membresia)
    REFERENCES Membresia (ID_Membresia);

-- Reference: Membresia_Usuario_Usuario (table: Membresia_Usuario)
ALTER TABLE Membresia_Usuario ADD CONSTRAINT Membresia_Usuario_Usuario
    FOREIGN KEY (ID_Usuario)
    REFERENCES Usuario (ID_Usuario);

-- Reference: Simulacion_Entrevista_Usuario (table: Simulacion_Entrevista)
ALTER TABLE Simulacion_Entrevista ADD CONSTRAINT Simulacion_Entrevista_Usuario
    FOREIGN KEY (ID_Usuario)
    REFERENCES Usuario (ID_Usuario);