-- Creando las bases de datos para una supuesta clinica
create database clinica;
use clinica;

-- Creamos la tabla del medico
create table medico (
    matricula int(11) primary key,
    nombre varchar(30),
    apellido varchar(30),
    especialidad varchar(20),
    observaciones text
);

-- Creamos la tabla del paciente
create table paciente (
    nss bigint(20),
    nombre varchar(30),
    apellido varchar(30),
    domicilio varchar(50),
    codigo_postal smallint(6),
    telefono varchar(16),
    numero_historial_clinico int(11) primary key,
    observaciones text
);

-- Creamos la tabla de ingreso
create table ingreso (
    id_ingreso int(11) primary key,
    fecha_ingreso date,
    numero_habitacion smallint(6),
    numero_cama smallint(6),
    observaciones text,
    numero_historial_paciente int(11),
    matricula_medico int(11),
    foreign key (numero_historial_paciente) references paciente(numero_historial_clinico),
    foreign key (matricula_medico) references medico(matricula)
);
insert into medico (matricula, nombre, apellido, especialidad, observaciones) values
(155, 'Alfredo', 'Gutierrez', 'Medicina Familiar', 'No atiende PAMI'),
(221, 'Luisa', 'Foseca', 'Cardiología', null),
(226, 'Frodo', 'Bolson', 'Pediatría', 'Solamente turno tarde'),
(332, 'Jesus Maria', 'Prates', 'Cirugía', null),
(334, 'Gandalf', 'Meriadoc', 'Infectología', null),
(449, 'Ricardo', 'Puchini', 'Medicina Familiar', 'medico clinico general'),
(645, 'Cacho', 'Villa', 'Oftalmología', null),
(733, 'Tatiana', 'Brandigamo', 'Pediatría', null),
(774, 'Alfonso', 'Chamorro', 'Cardiología', null),
(888, 'Pedro Pablo', 'Cichanowski', 'Urología', 'actualmente con licencia por covid');

insert into paciente (nss, nombre, apellido, domicilio, codigo_postal, telefono, numero_historial_clinico, observaciones) values
(32197, 'Aewin', 'Rohan', 'Valinor 1001', 2366, '3274-232336', 675, null),
(971649, 'Glorfindel', null, 'Arda Terminal esquina Avenida', 3360, '3755-447031', 778, 'realizar PCR'),
(316619, 'Karen', 'Sophia', 'Burgin Primeros Colonos y Junin', 3640, '3745-998877', 1236, null),
(3648, 'Gimli', null, 'Moria Juan de Orquideas 335', 3363, '3755-866545', 1488, null),
(87164, 'Legolas', null, 'Bosque Negro Krause y Villavieja', 3514, '3971-544444', 1498, 'historial de cardiopatias'),
(254651, 'Elrond', null, 'Rivendell Balneario Campo Grande', 3350, '3764-421479', 1884, null),
(369844, 'Galadriel', null, 'Lorien Bareiro 170', 2207, '3943-425561', 3212, null),
(44946, 'Josefina', 'Pereira Dias', 'Calle primera 201', 3363, '3755-587912', 4112, null),
(654165, 'Jose', 'Villagran', 'Arrayanes 1205', 3360, '3755-589478', 4551, null);

insert into ingreso (id_ingreso, fecha_ingreso, numero_habitacion, numero_cama, observaciones, numero_historial_paciente, matricula_medico) values
(1, '2021-11-01', 1, 2, null, 1884, 449),
(2, '2021-11-02', 1, 1, null, 1488, 226),
(3, '2021-11-02', 2, 4, 'falta completar carnet de vacunacion', 1498, 733),
(4, '2021-11-03', 1, 2, null, 4551, 774),
(5, '2021-11-05', 4, 7, null, 4112, 645),
(6, '2021-11-15', 5, 9, null, 1236, 226),
(7, '2021-11-17', 5, 10, null, 675, 774),
(8, '2021-12-09', 3, 6, null, 778, 888),
(9, '2021-12-11', 4, 8, 'solicitar electrocardiograma', 4112, 332),
(10, '2021-12-11', 2, 3, null, 3212, 774),
(11, '2021-12-18', 2, 4, null, 778, 334),
(12, '2021-12-22', 1, 1, null, 1488, 155),
(13, '2022-01-04', 9, 17, null, 1236, 645),
(14, '2022-01-11', 5, 9, null, 675, 226),
(15, '2022-01-12', 4, 8, null, 3212, 155),
(16, '2022-01-16', 8, 16, null, 1236, 226),
(17, '2022-01-24', 2, 3, null, 1488, 888),
(18, '2022-02-01', 8, 15, null, 3212, 334),
(19, '2022-02-14', 1, 2, null, 1884, 449),
(20, '2022-02-15', 7, 13, null, 4112, 888),
(21, '2022-03-02', 3, 5, null, 675, 155),
(22, '2022-03-07', 8, 12, null, 4551, 334),
(23, '2022-03-13', 3, 6, null, 1498, 645),
(24, '2022-03-16', 9, 18, null, 675, 155),
(25, '2022-03-19', 5, 9, null, 4112, 774),
(26, '2022-03-22', 6, 11, 'cuenta con servicio integral de rehabilitacion', 1498, 332),
(27, '2022-03-22', 3, 6, null, 1884, 332),
(28, '2022-03-22', 5, 10, null, 778, 449),
(29, '2022-03-23', 1, 1, null, 4112, 155),
(30, '2022-03-25', 3, 6, null, 1236, 226),
(31, '2022-03-29', 2, 4, null, 3212, 645),
(32, '2022-03-30', 9, 17, null, 4112, 155),
(33, '2022-04-05', 6, 11, 'internacion por deshidratacion', 1488, 733),
(34, '2022-04-07', 7, 13, null, 4551, 774);


select * from medico;
select * from paciente;
select * from ingreso;
