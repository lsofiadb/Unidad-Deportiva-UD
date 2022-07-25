package ud.unidad.deportiva.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ud.unidad.deportiva.model.Sede;
import ud.unidad.deportiva.repository.SedeRepository;


import java.util.List;

@Service
public class SedeService {

    @Autowired
    private SedeRepository sedeRepository;

    public List<Sede> getSedes(){
        return sedeRepository.findAll();
    }

    public Sede save(Sede sede){
        return sedeRepository.save(sede);
    }

    public Sede findById(String idSede){
        return sedeRepository.findById(idSede).get();
    }
}
