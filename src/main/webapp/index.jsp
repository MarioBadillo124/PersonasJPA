<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entidades.Persona" %>

<%
    List<Persona> personas =
            (List<Persona>) request.getAttribute("personas");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Personas</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            color: #333;
        }

        .contenedor {
            width: 90%;
            max-width: 1000px;
            margin: 40px auto;
        }

        .encabezado {
            background: #2c3e50;
            color: white;
            padding: 25px;
            border-radius: 10px 10px 0 0;
        }

        .encabezado h1 {
            margin: 0;
        }

        .encabezado p {
            margin-bottom: 0;
            opacity: 0.8;
        }

        .contenido {
            background: white;
            padding: 25px;
            border-radius: 0 0 10px 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        h2 {
            color: #2c3e50;
            margin-top: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th {
            background: #34495e;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f8f9fa;
        }

        .formulario {
            margin-top: 35px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 8px;
        }

        .campo {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
        }

        button {
            background: #27ae60;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
        }

        button:hover {
            background: #219150;
        }

        .editar {
            color: #2980b9;
            text-decoration: none;
            font-weight: bold;
        }

        .eliminar {
            color: #c0392b;
            text-decoration: none;
            font-weight: bold;
        }

        .editar:hover,
        .eliminar:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="contenedor">

    <div class="encabezado">
        <h1>Gestión de Personas</h1>
    </div>

    <div class="contenido">

        <h2>Personas registradas</h2>

        <table>

            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Edad</th>
                <th>Acciones</th>
            </tr>

            <%
                for (Persona persona : personas) {
            %>

            <tr>
                <td><%= persona.getId() %></td>
                <td><%= persona.getNombre() %></td>
                <td><%= persona.getApellido() %></td>
                <td><%= persona.getEdad() %></td>

                <td>
                    <a class="editar"
                       href="${pageContext.request.contextPath}/personas?accion=editar&id=<%= persona.getId() %>">
                        Editar
                    </a>

                    &nbsp;|&nbsp;

                    <a class="eliminar"
                       href="${pageContext.request.contextPath}/personas?accion=eliminar&id=<%= persona.getId() %>"
                       onclick="return confirm('¿Seguro que deseas eliminar esta persona?');">
                        Eliminar
                    </a>
                </td>
            </tr>

            <%
                }
            %>

        </table>


        <div class="formulario">

            <h2>Agregar persona</h2>

            <form action="${pageContext.request.contextPath}/personas"
                  method="post">

                <div class="campo">
                    <label>Nombre:</label>
                    <input type="text"
                           name="nombre"
                           placeholder="Ingresa el nombre"
                           required>
                </div>

                <div class="campo">
                    <label>Apellido:</label>
                    <input type="text"
                           name="apellido"
                           placeholder="Ingresa el apellido"
                           required>
                </div>

                <div class="campo">
                    <label>Edad:</label>
                    <input type="number"
                           name="edad"
                           min="1"
                           placeholder="Ingresa la edad"
                           required>
                </div>

                <button type="submit">
                    Guardar persona
                </button>

            </form>

        </div>

    </div>

</div>

</body>
</html>
