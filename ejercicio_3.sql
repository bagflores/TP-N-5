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