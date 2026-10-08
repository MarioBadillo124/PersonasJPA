package servlets;

import DAO.PersonaDAOImpl;
import entidades.Persona;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/personas")
public class PersonaServlet extends HttpServlet {

    private PersonaDAOImpl personaDAO;

    @Override
    public void init() {
        personaDAO = new PersonaDAOImpl();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        
        if ("eliminar".equals(accion)) {
            Integer id = Integer.parseInt(request.getParameter("id"));

            personaDAO.eliminar(id);

            response.sendRedirect(request.getContextPath() + "/personas");

            return;
        }

        if ("editar".equals(accion)) {
            String idTexto = request.getParameter("id");
            Integer id = Integer.parseInt(idTexto);

            Persona persona = personaDAO.buscarPorId(id);

            request.setAttribute("persona", persona);

            request.getRequestDispatcher("editar.jsp")
                    .forward(request, response);

        } else {

            List<Persona> personas = personaDAO.obtenerTodas();

            request.setAttribute("personas", personas);

            request.getRequestDispatcher("index.jsp")
                    .forward(request, response);
        }
    }
    
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String edadTexto = request.getParameter("edad");

        int edad = Integer.parseInt(edadTexto);

        if ("actualizar".equals(accion)) {

            Integer id = Integer.parseInt(request.getParameter("id"));

            Persona persona = personaDAO.buscarPorId(id);

            persona.setNombre(nombre);
            persona.setApellido(apellido);
            persona.setEdad(edad);

            personaDAO.actualizar(persona);

        } else {

            Persona persona = new Persona();

            persona.setNombre(nombre);
            persona.setApellido(apellido);
            persona.setEdad(edad);

            personaDAO.guardar(persona);
        }

        response.sendRedirect(request.getContextPath() + "/personas");
    }
}