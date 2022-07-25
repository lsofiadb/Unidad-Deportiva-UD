package ud.unidad.deportiva.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="sede")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Sede {
    @Id @Column
    private String idsede;
    @Column
    private String nombresede;
    @Column
    private String ubicacionsede;
    @Column
    private String url_image_sede;
}
