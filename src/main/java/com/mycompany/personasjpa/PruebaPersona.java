package com.mycompany.personasjpa;

import DAO.PersonaDAO;
import DAO.PersonaDAOImpl;
import entidades.Persona;
import java.util.List;


public class PruebaPersona {

    public static void main(String[] args) {
        
        PersonaDAO dao = new PersonaDAOImpl();
        
        List<Persona> personas = dao.obtenerTodas();

        for (Persona persona : personas) {
            System.out.println(persona.getId() + " - "
                    + persona.getNombre() + " "
                    + persona.getApellido() + " - "
                    + persona.getEdad());
        }
        
        Persona persona = dao.buscarPorId(2);

        System.out.println("busqueda por ID:");
        System.out.println(persona.getId() + " - "
                + persona.getNombre() + " "
                + persona.getApellido() + " - "
                + persona.getEdad());

            }
    
}
