<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entidades.Persona" %>

<%
    Persona persona = (Persona) request.getAttribute("persona");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar persona</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6f8;
        }

        .contenedor {
            width: 90%;
            max-width: 600px;
            margin: 50px auto;
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

        .formulario {
            background: white;
            padding: 30px;
            border-radius: 0 0 10px 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        .campo {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
        }

        button {
            background: #2980b9;
            color: white;
            border: none;
            padding: 11px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
        }

        button:hover {
            background: #2471a3;
        }

        .regresar {
            display: inline-block;
            margin-top: 20px;
            color: #555;
            text-decoration: none;
        }

        .regresar:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="contenedor">

    <div class="encabezado">
        <h1>Editar persona</h1>
    </div>

    <div class="formulario">

        <form action="${pageContext.request.contextPath}/personas"
              method="post">

            <input type="hidden"
                   name="accion"
                   value="actualizar">

            <input type="hidden"
                   name="id"
                   value="<%= persona.getId() %>">

            <div class="campo">
                <label>Nombre:</label>

                <input type="text"
                       name="nombre"
                       value="<%= persona.getNombre() %>"
                       required>
            </div>

            <div class="campo">
                <label>Apellido:</label>

                <input type="text"
                       name="apellido"
                       value="<%= persona.getApellido() %>"
                       required>
            </div>

            <div class="campo">
                <label>Edad:</label>

                <input type="number"
                       name="edad"
                       value="<%= persona.getEdad() %>"
                       min="1"
                       required>
            </div>

            <button type="submit">
                Actualizar persona
            </button>

        </form>

        <a class="regresar"
           href="${pageContext.request.contextPath}/personas">
            ← Regresar a la lista
        </a>

    </div>

</div>

</body>
</html>