package ud.unidad.deportiva.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name="empleado")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Empleado {
    @Id @Column
    private Long idcodigoempleado;

    @ManyToOne @JoinColumn(name = "idsede")
    private Sede sede;

    @ManyToOne @JoinColumn(name = "idcargoempleado")
    private CargoEmpleado cargoEmpleado;

    @Column
    private String nombresempleado;

    @Column
    private String apellidosempleado;

    @Column
    private Long cedulaempleado;

}
