package ud.unidad.deportiva.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ud.unidad.deportiva.model.Empleado;

@Repository
public interface EmpleadoRepository extends JpaRepository<Empleado,Long> {

}
