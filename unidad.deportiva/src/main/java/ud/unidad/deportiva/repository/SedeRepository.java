package ud.unidad.deportiva.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ud.unidad.deportiva.model.Sede;

@Repository
public interface SedeRepository extends JpaRepository<Sede, String> {
}
