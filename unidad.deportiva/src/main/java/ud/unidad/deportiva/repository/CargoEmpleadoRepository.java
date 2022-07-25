package ud.unidad.deportiva.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ud.unidad.deportiva.model.CargoEmpleado;

@Repository
public interface CargoEmpleadoRepository extends JpaRepository<CargoEmpleado, Long> {

}
