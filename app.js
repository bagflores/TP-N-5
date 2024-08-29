//--- requires ------------------------------------------
const express = require('express');
const app = express();
const morgan = require("morgan");

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(morgan("tiny"));
morgan(":method :url :status :res[content-length] - :response-time ms");

const configuracion = require("./config.json");

// aca habilitamos el controlador de medicos a busqueda
const medicoController = require("./Controller/medicoController.js");
app.use("/api/medico", medicoController);

// aca habilitamos el controlador de pacientes a busqueda
const pacienteController = require("./Controller/pacienteController.js");
app.use("/api/paciente", pacienteController);

// aca habilitamos el controlador de ingresos a busqueda
const ingresoController = require("./Controller/ingresoController.js");
app.use("/api/ingreso", ingresoController);

app.listen(configuracion.server.port, (err) => {
  if (err) {
    console.log(err);
  } else {
    console.log("Servidor encendido y escuchando en el puerto " + configuracion.server.port);
  }
});

app.get("/test", (req, res) => {
  res.send("Ruta de prueba alcanzada");
});
