package DAO;

import entidades.Persona;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.List;

public class PersonaDAOImpl implements PersonaDAO {

    private EntityManagerFactory emf =
        Persistence.createEntityManagerFactory(
            "com.mycompany_PersonasJPA_jar_1.0-SNAPSHOTPU"
        );

    @Override
    public List<Persona> obtenerTodas() {
        EntityManager em = emf.createEntityManager();

        try {
            return em.createNamedQuery("Persona.findAll", Persona.class)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public Persona buscarPorId(Integer id) {
        EntityManager em = emf.createEntityManager();

        try {
            return em.find(Persona.class, id);
        } finally {
            em.close();
        }
    }

    @Override
    public void guardar(Persona persona) {
        EntityManager em = emf.createEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(persona);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    @Override
    public void actualizar(Persona persona) {
        EntityManager em = emf.createEntityManager();

        try {
            em.getTransaction().begin();
            em.merge(persona);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    @Override
    public void eliminar(Integer id) {
        EntityManager em = emf.createEntityManager();

        try {
            em.getTransaction().begin();

            Persona persona = em.find(Persona.class, id);

            if (persona != null) {
                em.remove(persona);
            }

            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}