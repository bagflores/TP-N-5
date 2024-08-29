//codigo encargado de gestionar los datos de ingresos
require('rootpath')();

const mysql = require("mysql");
const configuracion = require("config.json");

// agregue las credenciales para acceder a la base de datos
const connection = mysql.createConnection(configuracion.database);

connection.connect((err) => {
    if (err) {
        console.log(err.code);
    } else {
        console.log("BD conectada");
    }
});
var metodos = {}

// obtener todos los ingresos, incluyendo nombres y apellidos de paciente y médico (punto 5 opcional)
metodos.getAll = function (callback) {
    let consulta = `
        select 
            ingreso.*,
            concat(paciente.apellido, ', ', paciente.nombre) as ApeNomPaciente,
            concat(medico.apellido, ', ', medico.nombre) as ApeNomMedico
        from ingreso
        join paciente on ingreso.numero_historial_paciente = paciente.numero_historial_clinico
        join medico on ingreso.matricula_medico = medico.matricula
    `;
    connection.query(consulta, function (err, resultados) {
        if (err) {
            callback(err);
        } else {
            callback(undefined, resultados);
        }
    });
}

// creamos un nuevo ingreso
metodos.crearIngreso = function (datosIngreso, callback) {
    let consulta = "insert into ingreso (fecha_ingreso, numero_habitacion, numero_cama, observaciones, numero_historial_paciente, matricula_medico) values (?, ?, ?, ?, ?, ?)";
    let ingreso = [
        datosIngreso.fecha_ingreso,
        datosIngreso.numero_habitacion,
        datosIngreso.numero_cama,
        datosIngreso.observaciones,
        datosIngreso.numero_historial_paciente,
        datosIngreso.matricula_medico
    ];

    connection.query(consulta, ingreso, (err, resultados) => {
        if (err) {
            callback(err);
        } else {
            callback(undefined, "ingreso creado exitosamente");
        }
    });
}

module.exports = { metodos }
