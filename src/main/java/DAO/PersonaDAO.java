package DAO;

import entidades.Persona;
import java.util.List;

public interface PersonaDAO {

    List<Persona> obtenerTodas();

    Persona buscarPorId(Integer id);

    void guardar(Persona persona);

    void actualizar(Persona persona);

    void eliminar(Integer id);
}