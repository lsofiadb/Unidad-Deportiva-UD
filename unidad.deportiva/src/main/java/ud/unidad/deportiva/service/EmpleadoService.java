package ud.unidad.deportiva.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ud.unidad.deportiva.model.Empleado;
import ud.unidad.deportiva.repository.EmpleadoRepository;

import java.util.List;

@Service
public class EmpleadoService {
    @Autowired
    private EmpleadoRepository empleadoRepository;

    public Empleado save(Empleado empleado){
        return empleadoRepository.save(empleado);
    }

    public List<Empleado> getEmpleados(){
        return empleadoRepository.findAll();
    }

    public Empleado update(Empleado empleado){
        return save(empleado);
    }
}
