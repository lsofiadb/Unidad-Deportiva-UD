package ud.unidad.deportiva.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ud.unidad.deportiva.model.CargoEmpleado;
import ud.unidad.deportiva.repository.CargoEmpleadoRepository;

import java.util.List;

@Service
public class CargoeEmpleadoService {

    @Autowired
    private CargoEmpleadoRepository cargoEmpleadoRepository;

    public CargoEmpleado save(CargoEmpleado cargoEmpleado){
        return cargoEmpleadoRepository.save(cargoEmpleado);
    }

    public List<CargoEmpleado> getCargos(){
        return  cargoEmpleadoRepository.findAll();
    }

    public CargoEmpleado findById(Long idCargoEmpleado){
        return cargoEmpleadoRepository.findById(idCargoEmpleado).get();
    }
}
