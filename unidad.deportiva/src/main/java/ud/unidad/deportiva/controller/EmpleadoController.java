package ud.unidad.deportiva.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import ud.unidad.deportiva.dto.EmpleadoDto;
import ud.unidad.deportiva.model.Empleado;
import ud.unidad.deportiva.service.CargoeEmpleadoService;
import ud.unidad.deportiva.service.EmpleadoService;
import ud.unidad.deportiva.service.SedeService;

import java.util.List;

@RestController
@RequestMapping("/empleado")
public class EmpleadoController {

    @Autowired
    private SedeService sedeService;

    @Autowired
    private CargoeEmpleadoService cargoeEmpleadoService;

    @Autowired
    private EmpleadoService empleadoService;

    @PostMapping("/save")
    public Empleado save(@RequestBody EmpleadoDto empleadoDto){
        Empleado empleado = new Empleado();
        empleado = empleadoDto.getEmpleado(empleadoDto);
        empleado.setSede(sedeService.findById(empleadoDto.getIdSede()));
        empleado.setCargoEmpleado(cargoeEmpleadoService.findById(empleadoDto.getIdCargo()));
        return empleadoService.save(empleado);
    }

    @GetMapping("/getEmpleados")
    public List<Empleado> getEmpleados(){
        return empleadoService.getEmpleados();
    }

    @PutMapping("/update")
    public Empleado update(@RequestBody EmpleadoDto empleadoDto){
        return save(empleadoDto);
    }
}
