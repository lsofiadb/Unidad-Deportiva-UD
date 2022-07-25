package ud.unidad.deportiva.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="cargoempleado")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CargoEmpleado {
    @Id @Column
    private Long idcargoempleado;
    @Column
    private String nombrecargoempleado;
}
