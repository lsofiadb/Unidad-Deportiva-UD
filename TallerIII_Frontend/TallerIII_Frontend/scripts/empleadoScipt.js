//Variables globales
const API_URL = "http://localhost:8081/";

//Eventos de los botones
const onclickSubmitEmpleado = () => {
  postEmpleado(getData());
  // console.table(getData());
};

// Obtener información del form
const getData = () => {
  const idcodigoempleado = Number(
    document.getElementById("IDCODIGOEMPLEADO").value
  );
  const idSede = document.getElementById("IDSEDE").value;
  const idCargo = Number(document.getElementById("IDCARGOEMPLEADO").value);
  const nombresempleado = document.getElementById("NOMBRESEMPLEADO").value;
  const apellidosempleado = document.getElementById("APELLIDOSEMPLEADO").value;
  const cedulaempleado = Number(
    document.getElementById("CEDULAEMPLEADO").value
  );

  let objetoForm = {
    idcodigoempleado,
    idSede,
    idCargo,
    nombresempleado,
    apellidosempleado,
    cedulaempleado,
  };

  return objetoForm;
  //   console.log(objetoForm);
};

getData();

//Metodos para consumir el endpoint
//GET
const getAll = async () => {
  const response = await fetch(API_URL + "empleado/getEmpleados", {
    method: "GET",
    redirect: "follow",
  });
  const data = await response.json();
  console.log(data);
};

//POST
const postEmpleado = async (objetoEmpleado) => {
  //   const objetoEmpleado = {
  //     idcodigoempleado: 4,
  //     idSede: "2",
  //     idCargo: 1,
  //     nombresempleado: "Juan",
  //     apellidosempleado: "Mecha",
  //     cedulaempleado: 461616,
  //   };
  const response = await fetch(API_URL + "empleado/save", {
    method: "POST",
    body: JSON.stringify(objetoEmpleado),
    headers: {
      "Content-Type": "application/json",
    },
  });
  const data = await response.json();
  //   console.log(data);
};

// //POST sede
// const postSede = async () => {
//   const objeto = {
//     idsede: "3",
//     nom_sede: "Macarena",
//     direccion_sede: "Cll algo con algo",
//   };

//   const response = await fetch(API_URL + "Sede/save", {
//     method: "POST",
//     body: JSON.stringify(objeto),
//     headers: {
//       "Content-Type": "application/json",
//     },
//   });
//   const data = await response.json();
//   console.log(data);
// };

// postSede();
