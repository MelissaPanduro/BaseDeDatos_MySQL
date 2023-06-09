/* Importar las Librerías */
var express = require("express");
var mysql = require("mysql");
var cors = require("cors");
var app = express();


/* Configuraciones */
app.use(express.json());
app.use(cors());


var conexion = mysql.createConnection(
    {
        host: "localhost",
        user: "root",
        password: "admin",
        database: "matriculas"
    }
);
conexion.connect(function (error) {
    if (error) {
      throw error;
    } else {
      console.log("Conexión exitosa");
    }
  });


  const puerto = process.env.PUERTO || 4000;

  app.listen(puerto, function () {
    console.log("Servidor funcionando en puerto: " + puerto);
  });

  app.post("/api/registros", (req, res) => {
    let data = {
        Nombres: req.body.NOMBRES,
        Apellidos: req.body.APELLIDOS,
        Dni: req.body.DNI,
        Celular: req.body.CELULAR,
        Email: req.body.EMAIL
    };
    let sql = "INSERT INTO registros SET ?";
    conexion.query(sql, data, function (error, results) {
      if (error) {
        throw error;
      } else {
        console.log(data);
        res.send(data);
      }
    });
    });

    // localhost:4000/api/registros //

