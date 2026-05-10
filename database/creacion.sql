-- Crear base de datos
CREATE DATABASE VetLinaresDB;
GO

-- Usar la base de datos
USE VetLinaresDB;
GO

-- Tabla Rol
CREATE TABLE Rol (
    id_rol INT PRIMARY KEY IDENTITY(1,1),
    nombre_rol VARCHAR(50) NOT NULL
);

-- Tabla Usuario
CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100),
    correo VARCHAR(100),
    id_rol INT,
    FOREIGN KEY (id_rol) REFERENCES Rol(id_rol)
);

-- Tabla Veterinaria
CREATE TABLE Veterinaria (
    id_veterinaria INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    comuna VARCHAR(100),
    atiende_urgencias BIT
);

-- Tabla Servicio
CREATE TABLE Servicio (
    id_servicio INT PRIMARY KEY IDENTITY(1,1),
    nombre_servicio VARCHAR(100)
);

-- Tabla Veterinaria_Servicio (relación muchos a muchos)
CREATE TABLE Veterinaria_Servicio (
    id_vet_servicio INT PRIMARY KEY IDENTITY(1,1),
    id_veterinaria INT,
    id_servicio INT,
    FOREIGN KEY (id_veterinaria) REFERENCES Veterinaria(id_veterinaria),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

-- Tabla Horario
CREATE TABLE Horario (
    id_horario INT PRIMARY KEY IDENTITY(1,1),
    dia_semana VARCHAR(50),
    hora_apertura TIME,
    hora_cierre TIME,
    id_veterinaria INT,
    FOREIGN KEY (id_veterinaria) REFERENCES Veterinaria(id_veterinaria)
);

-- Tabla Reseña
CREATE TABLE Reseña (
    id_resena INT PRIMARY KEY IDENTITY(1,1),
    calificacion INT,
    comentario VARCHAR(255),
    id_usuario INT,
    id_veterinaria INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_veterinaria) REFERENCES Veterinaria(id_veterinaria)
);

-- Tabla Favorito
CREATE TABLE Favorito (
    id_favorito INT PRIMARY KEY IDENTITY(1,1),
    id_usuario INT,
    id_veterinaria INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_veterinaria) REFERENCES Veterinaria(id_veterinaria)
);

-- Tabla Emergencia
CREATE TABLE Emergencia (
    id_emergencia INT PRIMARY KEY IDENTITY(1,1),
    tipo_emergencia VARCHAR(100),
    nivel_urgencia VARCHAR(50),
    descripcion VARCHAR(255),
    fecha DATETIME,
    id_usuario INT,
    id_veterinaria INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_veterinaria) REFERENCES Veterinaria(id_veterinaria)
);