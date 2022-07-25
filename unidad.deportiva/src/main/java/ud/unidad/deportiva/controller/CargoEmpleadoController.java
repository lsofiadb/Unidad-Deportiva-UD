package ud.unidad.deportiva.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import ud.unidad.deportiva.model.CargoEmpleado;
import ud.unidad.deportiva.service.CargoeEmpleadoService;

import java.util.List;

@RestController
@RequestMapping("/cargoEmpleado")
public class CargoEmpleadoController {

    @Autowired
    private CargoeEmpleadoService cargoeEmpleadoService;

    @GetMapping("/getCargos")
    public List<CargoEmpleado> getCargos(){
        return cargoeEmpleadoService.getCargos();
    }

    @PostMapping("/save")
    public CargoEmpleado save(@RequestBody CargoEmpleado cargoEmpleado){
        return cargoeEmpleadoService.save(cargoEmpleado);
    }
}
