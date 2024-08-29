//--- requires ------------------------------------------
const express = require('express');

const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const ingresoBD = require("./../Model/ingresoModel.js");

// -------------------------------------------------------- 
// --rutas de escucha (endpoint) dispoibles para INGRESO--- 
// --------------------------------------------------------

app.get("/", listarTodo);
app.post('/create', crear);

function listarTodo(req, res) {
    ingresoBD.metodos.getAll((err, result) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}

function crear(req, res) {
    ingresoBD.metodos.crearIngreso(req.body, (err, exito) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(201).json(exito);
        }
    });
}

module.exports = app;
