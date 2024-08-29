//--- requires ------------------------------------------
const express = require('express');
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const pacienteBD = require("./../Model/pacienteModel.js");
const medicoBD = require("./../Model/medicosModel.js");

// ------------------------------------------------------------------------ 
// --rutas de escucha (endpoint) dispoibles para usuario administrativo --- 
// ------------------------------------------------------------------------

app.get("/", listarTodo);

app.get("/:especialidad", getByEspecialidad);

app.post('/create', crear);
app.get('/:nhc', obtenerPaciente);
app.delete("/:nhc", eliminarPaciente);
app.put("/:nhc", modificarPaciente);

app.get("/nss/:nss", obtenerPacientePorNSS);

// ------------------------------------------------------------------------
// --a las funciones -------------------------------------------------------------
// ------------------------------------------------------------------------

function listarTodo(req, res) {
    pacienteBD.metodos.getAll((err, result) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}

function obtenerPaciente(req, res) {
    let nhc = req.params.nhc;
    pacienteBD.metodos.getPaciente(nhc, (err, result) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}

function crear(req, res) {
    pacienteBD.metodos.crearPaciente(req.body, (err, exito) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(201).json(exito);
        }
    });
}

function modificarPaciente(req, res) {
    let nhc = req.params.nhc;
    pacienteBD.metodos.update(req.body, nhc, (err, exito) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).json(exito);
        }
    });
}

function eliminarPaciente(req, res) {
    let nhc = req.params.nhc;
    pacienteBD.metodos.deletePaciente(nhc, (err, exito) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).json(exito);
        }
    });
}

function obtenerPacientePorNSS(req, res) {
    let nss = req.params.nss;
    pacienteBD.metodos.getByNSS(nss, (err, result) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}

function getByEspecialidad(req, res) {
    let especialidad = req.params.especialidad;
    medicoBD.metodos.getByEspecialidad(especialidad, (err, result) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}

// exportamos app que es nuestro servidor express al cual se le agregaron endpoints de escucha
module.exports = app;
