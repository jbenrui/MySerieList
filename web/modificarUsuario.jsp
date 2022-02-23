<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="./estilo/style.css">
        <link rel="shortcut icon" href="./imagenes/favicon.ico" type="image/x-icon">
        <title>MySerieList</title>
    </head>
    <body class="bg-fondoCrudImagen">
        <div id="wrapper" class="container-fluid position-absolute top-50 start-50 translate-middle">
            <div class="table-responsive color-anadir text-justify">
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
                    Statement s = conexion.createStatement();

                    request.setCharacterEncoding("UTF-8");
                    String confirmacion =".";
                

                %>
               <table class="mx-auto w-50 table bg-tablaCrud color-texto ">
                    <thead>
                        <tr>
                        <th scope="col"></th>
                        <th scope="col">Alias</th>
                        <th scope="col">Contraseña</th>
                        <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <form action="ModUsuario.jsp">
                            <tr>
                            <th scope="row"></th>
                                <td>
                                    <input type="hidden" class="form-control" placeholder="Nombre" aria-label="Nombre" value="<%=request.getParameter("idUser")%>" name="idUser" >
                                    <input type="text" class="form-control" placeholder="Alias" aria-label="Alias" name="Alias" value="<%=request.getParameter("Alias")%>" required>

                                </td>
                                <td>
                                    <input type="text" class="form-control" placeholder="Password" aria-label="Password" name="Contrasena" value="<%=request.getParameter("Contrasena")%>" required>
                                </td>
                                <td>
                                      <button class="btn btn-color color-texto btn-block" type="submit"><i class="bi bi-pencil"></i>Modificar</button>
                                      <a class="btn btn-color color-texto btn-block" href="<%="listaUsuarios.jsp?confirmacion="+confirmacion%>">Volver</a>
                                </td>
                            </tr>
                        </form>
                    </tbody>
                </table>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
    <%
       conexion.close();
    %>
</html>