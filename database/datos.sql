USE VetLinaresDB;
GO

-- Insertar roles
INSERT INTO Rol (nombre_rol) VALUES ('Administrador');
INSERT INTO Rol (nombre_rol) VALUES ('Usuario');

-- Insertar usuarios
INSERT INTO Usuario (nombre, correo, id_rol)
VALUES ('Damian Zambrano', 'damian@email.com', 1);

INSERT INTO Usuario (nombre, correo, id_rol)
VALUES ('Usuario Prueba', 'usuario@email.com', 2);

-- Insertar veterinarias
INSERT INTO Veterinaria (nombre, direccion, comuna, atiende_urgencias)
VALUES ('Veterinaria Central Linares', 'Av. Brasil 123', 'Linares', 1);

INSERT INTO Veterinaria (nombre, direccion, comuna, atiende_urgencias)
VALUES ('Clínica Veterinaria San Francisco', 'Calle Independencia 456', 'Linares', 1);

INSERT INTO Veterinaria (nombre, direccion, comuna, atiende_urgencias)
VALUES ('Vet Mascotas Linares', 'Calle Maipú 789', 'Linares', 0);

-- Insertar servicios
INSERT INTO Servicio (nombre_servicio) VALUES ('Consulta General');
INSERT INTO Servicio (nombre_servicio) VALUES ('Urgencias');
INSERT INTO Servicio (nombre_servicio) VALUES ('Vacunación');

-- Relación veterinaria-servicio
INSERT INTO Veterinaria_Servicio (id_veterinaria, id_servicio) VALUES (1,1);
INSERT INTO Veterinaria_Servicio (id_veterinaria, id_servicio) VALUES (1,2);
INSERT INTO Veterinaria_Servicio (id_veterinaria, id_servicio) VALUES (2,1);
INSERT INTO Veterinaria_Servicio (id_veterinaria, id_servicio) VALUES (2,2);
INSERT INTO Veterinaria_Servicio (id_veterinaria, id_servicio) VALUES (3,1);

-- Insertar horarios
INSERT INTO Horario (dia_semana, hora_apertura, hora_cierre, id_veterinaria)
VALUES ('Lunes a Viernes', '09:00', '18:00', 1);

INSERT INTO Horario (dia_semana, hora_apertura, hora_cierre, id_veterinaria)
VALUES ('Lunes a Viernes', '10:00', '19:00', 2);

-- Insertar reseñas
INSERT INTO Reseña (calificacion, comentario, id_usuario, id_veterinaria)
VALUES (5, 'Excelente atención', 2, 1);

INSERT INTO Reseña (calificacion, comentario, id_usuario, id_veterinaria)
VALUES (4, 'Muy buena clínica', 2, 2);

-- Insertar favoritos
INSERT INTO Favorito (id_usuario, id_veterinaria)
VALUES (2, 1);

-- Insertar emergencias
INSERT INTO Emergencia (tipo_emergencia, nivel_urgencia, descripcion, fecha, id_usuario, id_veterinaria)
VALUES ('Accidente', 'Alta', 'Mascota atropellada', GETDATE(), 2, 1);