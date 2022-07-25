let globalData = {};

let principalContainer = document.getElementById("principal-container");

function updatePage() {
  globalData.map((key, value) => {
    console.log(value);
    console.log(key);
    principalContainer.innerHTML += `<div class="card m-3" style="width: 18rem;" id="${
      key.idcodigoempleado
    }">
    <div class="info">                                            <img src="${"./empleado.jpg"}" class="card-img-top" alt="...">
                                            <div class="card-body">
                                            <h5 class="card-title"> <span class="bold"> ID: ${
                                              key.idcodigoempleado
                                            }<span></h5>
                                            <p class="card-text"><span class="bold">Nombres: </span>${
                                              key.nombresempleado
                                            }</p>
                                            <p class="card-text"><span class="bold">Apellidos: </span>${
                                              key.apellidosempleado
                                            } </p>
                                            <p class="card-text"><span class="bold">Cargo: </span>${
                                              key.cargoEmpleado
                                                .nombrecargoempleado
                                            } </p>
                                            </div>
                                            <div class="row">
<button type="button"  class="btn bton-purple3 btn-light buttonVerMas" data-toggle="modal" data-target="#myModal${
      key.idcodigoempleado
    }">Ver mas</button>
<p></p>

</div>
                                              <div class="d-flex justify-content-center mt-4">
                                            </div>
                                        </div>
                                                          <!-- Modal -->
                                        <div class="modal fade" id="myModal${
                                          key.idcodigoempleado
                                        }" role="dialog">
                                          <div class="modal-dialog">
                                          
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                              <div class="modal-header">
                                                <h5 class="modal-title">Detalles</h5>
                                                
                                              </div>
                                              <div class="modal-body">
                                              <p class="card-text"><span class="bold"> Nombres: </span>${
                                                key.nombresempleado
                                              }</p>
                                              <p class="card-text"><span class="bold">Apellidos: </span>${
                                                key.apellidosempleado
                                              } </p>
          <div class="row">  
                                                
                                              </div>
                                              <div class="modal-footer">
                    <button type="button" class="btn btn-purple" data-dismiss="modal">Close</button>
<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModalEditar${
      key.idcodigoempleado
    }" >Editar</button>
                                              </div>
                                            </div>
                                            
                                          </div>
                                        </div>

<div class="modal"  id="myModalEditar${key.idcodigoempleado}">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Editar información del empleado</h5>
      </div>
      <div class="modal-body">
        <form>
          
        <div class="form-group row">
        <label for="idcodigoempleado${
          key.idcodigoempleado
        }" class="col-sm-2 col-form-label">Id Codigo empleado</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="idcodigoempleado${
            key.idcodigoempleado
          }" value="${key.idcodigoempleado}" >
        </div>
      </div>

      <div class="form-group row">
        <label for="idcodigoempleado${
          key.idcodigoempleado
        }" class="col-sm-2 col-form-label">Id Sede</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="idsede${
            key.idcodigoempleado
          }" value="${key.sede.idsede}" >
        </div>
      </div>

      <div class="form-group row">
        <label for="idCargo${
          key.idcodigoempleado
        }" class="col-sm-2 col-form-label">Id Cargo empleado</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="idCargo${
            key.idcodigoempleado
          }" value="${key.cargoEmpleado.idcargoempleado}" >
        </div>
      </div>

          <div class="form-group row">
            <label for="nombresempleado${
              key.idcodigoempleado
            }" class="col-sm-2 col-form-label">Nombres</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="nombresempleado${
                key.idcodigoempleado
              }" value="${key.nombresempleado}" >
            </div>
          </div>

					<div class="form-group row">
            <label for="apellidosempleado${
              key.idcodigoempleado
            }" class="col-sm-2 col-form-label">Apellidos</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="apellidosempleado${
                key.idcodigoempleado
              }" value="${key.apellidosempleado}" >
            </div>
          </div>

					<div class="form-group row">
            <label for="cedulaempleado${
              key.idcodigoempleado
            }" class="col-sm-2 col-form-label">Cedula empleado</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="cedulaempleado${
                key.idcodigoempleado
              }" value="${key.cedulaempleado}" >
            </div>
          </div>

					
					
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-success" onclick="setNewInfoHeroe('idcodigoempleado${
          key.idcodigoempleado
        }', 'idsede${key.idcodigoempleado}', 'idCargo${
      key.idcodigoempleado
    }', 'nombresempleado${key.idcodigoempleado}', 'apellidosempleado${
      key.idcodigoempleado
    }', 'cedulaempleado${key.idcodigoempleado}')">Editar</button>
				
      </div>
    </div>
  </div>
</div>

<div class="modal"  id="myModalConfirm${key.idcodigoempleado}">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Confirmación</h5>
        
      </div>
      <div class="modal-body">
        <p>¿Está seguro que quiere borrar el heroe?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
        <button type="button" class="btn btn-danger" onclick="deleteHeroe('${
          key.idcodigoempleado
        }')">Si</button>
				
      </div>
    </div>
  </div>
</div>
                                        `;
  });
}

const API = "http://localhost:8081/";

const getAll = async () => {
  const response = await fetch(API + "empleado/getEmpleados");
  const data = await response.json();
  globalData = data;
  console.log(data);
  updatePage();
};

const getHeroe = async (id) => {
  const URL = `${API}/${id}.json`;
  const response = await fetch(URL);
  const data = await response.json();
  console.log(data);
};

const getInfoHeroe = () => {
  let data = {
    idcodigoempleado: Number(document.getElementById("idEmpleado").value),
    idSede: document.getElementById("idSede").value,
    idCargo: Number(document.getElementById("idCargo").value),
    nombresempleado: document.getElementById("nombres").value,
    apellidosempleado: document.getElementById("apellidos").value,
    cedulaempleado: Number(document.getElementById("cedula").value),
  };
  addHeroe(data);
};

const setNewInfoHeroe = (
  idcodigoempleado,
  idsede,
  idcargoempleado,
  nombresempleado,
  apellidosempleado,
  cedulaempleado
) => {
  let newData = {
    idcodigoempleado: Number(document.getElementById(idcodigoempleado).value),
    idSede: document.getElementById(idsede).value,
    idCargo: Number(document.getElementById(idcargoempleado).value),
    nombresempleado: document.getElementById(nombresempleado).value,
    apellidosempleado: document.getElementById(apellidosempleado).value,
    cedulaempleado: Number(document.getElementById(cedulaempleado).value),
  };
  updateHeroe(newData);
};

const addHeroe = async (heroe) => {
  const response = await fetch(API + "empleado/save", {
    method: "POST",
    body: JSON.stringify(heroe),
    headers: {
      "Content-Type": "application/json",
    },
  });
  const data = await response.json();
  //   console.log(data);
  location.reload();
};

const updateHeroe = async (heroe) => {
  const response = await fetch(API + "empleado/update", {
    method: "PUT", // POST, PUT, DELETE
    body: JSON.stringify(heroe),
    headers: {
      "Content-Type": "application/json",
    },
  });
  const data = await response.json();
  location.reload();
};

const deleteHeroe = async (id) => {
  const response = await fetch(`${API}/${id}.json`, {
    method: "DELETE", // POST, PUT, DELETE
  });
  const data = await response.json();
  location.reload();
};

getAll();
