package ud.unidad.deportiva.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ud.unidad.deportiva.model.Sede;
import ud.unidad.deportiva.service.SedeService;

import java.util.List;

@RestController
@RequestMapping("/sede")
public class SedeController {

    @Autowired
    private SedeService sedeService;

    @GetMapping("/getSedes")
    public List<Sede> getSedes(){
        return sedeService.getSedes();
    }
}
