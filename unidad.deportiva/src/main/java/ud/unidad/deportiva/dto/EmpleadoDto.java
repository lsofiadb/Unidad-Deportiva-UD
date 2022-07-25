package ud.unidad.deportiva.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import ud.unidad.deportiva.model.CargoEmpleado;
import ud.unidad.deportiva.model.Empleado;
import ud.unidad.deportiva.model.Sede;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmpleadoDto {

    private Long idcodigoempleado;

    private String idSede;

    private Long idCargo;

    private String nombresempleado;

    private String apellidosempleado;

    private Long cedulaempleado;

    public Empleado getEmpleado(EmpleadoDto empleadoDto){
        Empleado empleado = new Empleado();
        empleado.setIdcodigoempleado(empleadoDto.getIdcodigoempleado());
        empleado.setNombresempleado(empleadoDto.getNombresempleado());
        empleado.setApellidosempleado(empleadoDto.getApellidosempleado());
        empleado.setCedulaempleado(empleadoDto.getCedulaempleado());
        return empleado;
    }
}
