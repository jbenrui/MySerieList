<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" >
        <link rel="stylesheet" href="./estilo/style.css">
        <link rel="shortcut icon" href="./imagenes/favicon.ico" type="image/x-icon">
        <title>MySerieList</title>
    </head>
    <body class="bg-fondoCrudImagen">
        <div id="wrapper" class="p-5 mx-auto container-fluid panel panel-default bg-fondoCrudImagen">
            <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
          Statement s = conexion.createStatement();
          String usuario = (String)session.getAttribute("usuario");
          ResultSet listado = s.executeQuery("(SELECT * FROM usuario WHERE Alias != 'null')");
          
          String confirmacion = request.getParameter("confirmacion");
        %>
        
        
        
        
        <div class="card mx-auto mb-3 bg-usuario color-texto" style="max-width: 640px">
            <%listado.next();
                session.setAttribute("idUser", listado.getString("idUser"));

                String idUsuario = (String)session.getAttribute("idUser");
            %>
        <div class="row g-0">
          <div class="col-md-4">
            <img src="./imagenes/Login/usuarioPerfil.png" class="img-fluid rounded-circle p-4" alt="...">
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h3 class="card-title">Te has logueado como : <%=usuario%></h3>
              <p class="card-text">Para salir de la sesion pulsa en el siguiente boton.</p>
              <a class="btn btn-info btn-block"href="logout.jsp">Salir</a>
            </div>
          </div>
        </div>
      </div>
              
        <%
            if (confirmacion.equals("mod")){
                    %>
                    <div class="alert mx-auto w-50 bg-alertas color-texto" role="alert">
                        <p>¡Los cambios han surtido efecto!</p>
                    </div>
                    <%
            } else if (confirmacion.equals("add")){
                %>
                    <div class="alert mx-auto w-50 bg-alertas color-texto" role="alert">
                        <p>¡Se ha creado un nuevo usuario!</p>
                    </div>
                <%
            } else if (confirmacion.equals("del")){
                %>
                    <div class="alert mx-auto w-50 bg-alertas color-texto" role="alert">
                        <p>¡Se ha borrado un usuario!</p>
                    </div>
                <%
            }else{
                
            }
        %>
        
        <div class=" mx-auto color-anadir text-justify table-responsive">
            <table class="mx-auto w-50 table bg-tablaCrud color-texto">
                <thead>
                    <tr>
                    <th scope="col"></th>
                    <th scope="col">Alias</th>
                    <th scope="col">Contraseña</th>
                    <th scope="col">Modificar</th>
                    <th scope="col">Borrar</th>
                    </tr>
                </thead>
                <tbody>
                <%
                     while (listado.next()) {
                %>
                    <tr>
                    <th scope="row"></th>
                        <td><%=listado.getString("Alias")%></td>
                        <td><%=listado.getString("Contrasena")%></td>
                        <td>
                            <form method="get" action="modificarUsuario.jsp">
                                <input type="hidden" name="idUser" value="<%=listado.getString("idUser")%>">
                                <input type="hidden" name="Alias" value="<%=listado.getString("Alias")%>">
                                <input type="hidden" name="Contrasena" value="<%=listado.getString("Contrasena")%>">
                                <button type="submit"  class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span><i class="bi bi-pencil"></i> Modificar</button>
                            </form>
                        </td>
                        <td>
                            <form method="get" action="borrarUsuario.jsp">
                                <input type="hidden" name="idUser" value="<%=listado.getString("idUser")%>"/>
                                <button type="submit"class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span><i class="bi bi-trash3"></i> Borrar</button>
                            </form>
                        </td>
                    </tr>
                    <%
                       }
                       conexion.close();
                     %>
                </tbody>
            </table>

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
                <form action="anadirUsuario.jsp">
                    <tr>
                    <th scope="row"></th>
                        <td>
                            <input type="text" class="form-control" placeholder="Alias" aria-label="Alias" name="Alias" required>

                        </td>
                        <td>
                            <input type="text" class="form-control" placeholder="Password" aria-label="Password" name="Contrasena" required>
                        </td>
                        <td>
                          <button class="btn btn-info btn-block" type="submit"><i class="bi bi-plus-circle-fill"> </i>Crear</button>
                        </td>
                    </tr>
                </form>
                </tbody>
                </table>
            </div>
          </div>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>