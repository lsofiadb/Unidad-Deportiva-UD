let globalData = {}

let principalContainer = document.getElementById('principal-container')

function updatePage() {
  globalData.map((key, value) => {

    console.log(value)
    console.log(key)
        principalContainer.innerHTML += `<div class="card m-3" style="width: 18rem;" id="${key.idcodigoempleado}">
                                            <img src="${"./empleado.png"}" class="card-img-top" alt="...">
                                            <div class="card-body">
                                            <h5 class="card-title"><span class="bold"> ${key.idcodigoempleado}<span></h5>
                                            <p class="card-text"><span class="bold"> Nombres: </span>${key.nombresempleado}</p>
                                            <p class="card-text"><span class="bold">Apellidos: </span>${key.apellidosempleado} </p>
				<div class="row">
                                            <p class="card-text"><span class="bold">Cargo: </span>${key.cargoEmpleado.nombrecargoempleado} </p>
                                            <div class="row">
<button type="button" class="btn btn-light" data-toggle="modal" data-target="#myModal${key.idcodigoempleado}">Ver mas</button>
<p></p>
<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModalConfirm${key.idcodigoempleado}" >Eliminar</button>
</div>
                                              <div class="d-flex justify-content-center mt-4">
                                            </div>
                                        </div>
                                                          <!-- Modal -->
                                        <div class="modal fade" id="myModal${key.idcodigoempleado}" role="dialog">
                                          <div class="modal-dialog">
                                          
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                              <div class="modal-header">
                                                <h5 class="modal-title">Detalles</h5>
                                                
                                              </div>
                                              <div class="modal-body">
                                              <p class="card-text"><span class="bold"> Nombres: </span>${key.nombresempleado}</p>
                                              <p class="card-text"><span class="bold">Apellidos: </span>${key.apellidosempleado} </p>
          <div class="row">  
                                                
                                              </div>
                                              <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModalEditar${key.idcodigoempleado}" >Editar</button>
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
        <label for="idcodigoempleado${key.idcodigoempleado}" class="col-sm-2 col-form-label">Id Codigo empleado</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="idcodigoempleado${key.idcodigoempleado}" value="${key.idcodigoempleado}" >
        </div>
      </div>

      <div class="form-group row">
        <label for="idcodigoempleado${key.idcodigoempleado}" class="col-sm-2 col-form-label">Id Sede</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="idsede${key.idcodigoempleado}" value="${key.sede.idsede}" >
        </div>
      </div>

      <div class="form-group row">
        <label for="idCargo${key.idcodigoempleado}" class="col-sm-2 col-form-label">Id Cargo empleado</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="idCargo${key.idcodigoempleado}" value="${key.cargoEmpleado.idcargoempleado}" >
        </div>
      </div>

          <div class="form-group row">
            <label for="nombresempleado${key.idcodigoempleado}" class="col-sm-2 col-form-label">Nombres</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="nombresempleado${key.idcodigoempleado}" value="${key.nombresempleado}" >
            </div>
          </div>

					<div class="form-group row">
            <label for="apellidosempleado${key.idcodigoempleado}" class="col-sm-2 col-form-label">Apellidos</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="apellidosempleado${key.idcodigoempleado}" value="${key.apellidosempleado}" >
            </div>
          </div>

					<div class="form-group row">
            <label for="cedulaempleado${key.idcodigoempleado}" class="col-sm-2 col-form-label">Cedula empleado</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="cedulaempleado${key.idcodigoempleado}" value="${key.cedulaempleado}" >
            </div>
          </div>

					
					
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-success" onclick="setNewInfoHeroe('idcodigoempleado${key.idcodigoempleado}', 'idsede${key.idcodigoempleado}', 'idCargo${key.idcodigoempleado}', 'nombresempleado${key.idcodigoempleado}', 'apellidosempleado${key.idcodigoempleado}', 'cedulaempleado${key.idcodigoempleado}')">Editar</button>
				
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
        <button type="button" class="btn btn-danger" onclick="deleteHeroe('${key.idcodigoempleado}')">Si</button>
				
      </div>
    </div>
  </div>
</div>
                                        `
      
    })
}

const API = "http://localhost:8081/";

const getAll = async() => {
    const response = await fetch(API + "empleado/getEmpleados")
    const data = await response.json()
    globalData = data
    console.log(data)
    updatePage()
}

const getHeroe = async(id) => {
    const URL = `${API}/${id}.json`
    const response = await fetch(URL)
    const data = await response.json()
    console.log(data);
}

const getInfoHeroe = ()=>{
	let data = {
     idcodigoempleado: Number(document.getElementById("idEmpleado").value),
     idSede: document.getElementById("idSede").value,
     idCargo: Number(document.getElementById("idCargo").value),
     nombresempleado: document.getElementById("nombres").value,
     apellidosempleado: document.getElementById("apellidos").value,
     cedulaempleado: Number(document.getElementById("cedula").value)
			   
		}
    console.log("-------------DATAAAAAAAAAAAAAAAAAA-----------")
    console.log(data)
	addHeroe(data)
}

const setNewInfoHeroe = (idcodigoempleado, idsede, idcargoempleado, nombresempleado, apellidosempleado, cedulaempleado)=>{
	console.log("entroooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo");
  console.log(idcodigoempleado);
  console.log(idsede);
  console.log(idcargoempleado);
  console.log(nombresempleado);
  console.log(apellidosempleado);
  console.log(cedulaempleado);

  console.log(Number(document.getElementById(idcodigoempleado).value));
  console.log(document.getElementById(idsede).value);
  console.log(Number(document.getElementById(idcargoempleado).value));
  console.log(document.getElementById(nombresempleado).value);
  console.log(document.getElementById(apellidosempleado).value);
  console.log(Number(document.getElementById(cedulaempleado).value));

  let newData = {
    idcodigoempleado: Number(document.getElementById(idcodigoempleado).value),
    idSede: document.getElementById(idsede).value,
    idCargo: Number(document.getElementById(idcargoempleado).value),
    nombresempleado: document.getElementById(nombresempleado).value,
    apellidosempleado: document.getElementById(apellidosempleado).value,
    cedulaempleado: Number(document.getElementById(cedulaempleado).value)
          
	}
  console.log("------------DATOS UPDATE-------------")
  console.log(newData)
	updateHeroe( newData)
}

const addHeroe = async (heroe) => {
  //   const objetoEmpleado = {
  //     idcodigoempleado: 4,
  //     idSede: "2",
  //     idCargo: 1,
  //     nombresempleado: "Juan",
  //     apellidosempleado: "Mecha",
  //     cedulaempleado: 461616,
  //   };
  const response = await fetch(API + "empleado/save", {
    method: "POST",
    body: JSON.stringify(heroe),
    headers: {
      "Content-Type": "application/json",
    },
  });
  const data = await response.json();
  //   console.log(data);
  location.reload()
};

const updateHeroe = async( heroe) => {
    const response = await fetch(API + "empleado/update", {
        method: 'PUT', // POST, PUT, DELETE
        body: JSON.stringify(heroe),
        headers: {
            'Content-Type': 'application/json'
        }
    })
    const data = await response.json()
    location.reload()
}

const deleteHeroe = async(id) => {
    const response = await fetch(`${API}/${id}.json`, {
        method: 'DELETE', // POST, PUT, DELETE
    })
    const data = await response.json();
	location.reload()
}

getAll()