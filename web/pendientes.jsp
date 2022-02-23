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
    <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
          Statement s = conexion.createStatement();
          Statement u = conexion.createStatement();
          String usuario = (String)session.getAttribute("usuario");
          String confirmacion =".";
          ResultSet listado = s.executeQuery("(SELECT * FROM listaserie JOIN generoprincipal on listaserie.idGenero=generoprincipal.idGenero JOIN tipo on listaserie.idTIPO=tipo.idTipo JOIN usuario on listaserie.idUser=usuario.idUser WHERE Alias='"+usuario+"' AND estado='Pendiente')");
         
          ResultSet consultaIdUser = u.executeQuery("(SELECT * FROM usuario WHERE Alias='"+usuario+"')");
    %>
    <body class="bg-fondoCrudImagen">
        <nav class="navbar navbar-expand-lg navbar-light color-texto bg-fondoCrud">
            <div class="container-fluid me-5">
                <a class="navbar-brand" href="#">
                    <img src="./imagenes/favicon.ico" width="45px" />
                </a>
                <form class="d-flex" action="buscar.jsp">
                  <input class="form-control me-2" type="search" name="busca" placeholder="Search" aria-label="Search">
                  <button class="btn btn-outline-info" type="submit">Search</button>
                </form>
              </div>
        </nav>
        <div id="wrapper" class="p-5 mx-auto container-fluid panel panel-default bg-fondoCrudImagen">
        
        <div class="card mx-auto mb-3 bg-usuario color-texto" style="max-width: 640px">
            <%consultaIdUser.next();
                session.setAttribute("idUser", consultaIdUser.getString("idUser"));

                String idUsuario = (String)session.getAttribute("idUser");
            %>
        <div class="row g-0">
          <div class="col-md-4">
            <img src="./imagenes/Login/usuarioPerfil.png" class="img-fluid rounded-circle p-4" alt="...">
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title">Te has logueado como : <%=consultaIdUser.getString("Alias")%></h5>
              <p class="card-text">Para salir de la sesion pulsa en el siguiente boton.</p>
              <a class="btn btn-info btn-block"href="logout.jsp">Salir</a>
              <a class="btn btn-info btn-block"href="<%="listar.jsp?confirmacion="+confirmacion%>">Volver</a>
              <a class="btn btn-info btn-block"href="vistos.jsp">Ver vistos</a>
            </div>
          </div>
        </div>
      </div>
            
        <div class=" col-xs-3 mx-auto shadow p-3 mb-5 color-anadir rounded text-justify table-responsive bg-fondoCrud">
                <table class="mx-auto w-100 table bg-tablaCrud color-texto">
                    <thead>
                        <tr>
                        <th scope="col"></th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Genero</th>
                        <th scope="col">Tipo</th>
                        <th scope="col">Valoración</th>
                        <th scope="col">Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                         while (listado.next()) {
                    %>
                        <tr>
                        <th scope="row"></th>
                            <td><%=listado.getString("NomList")%></td>
                            <td><%=listado.getString("NomGenero")%></td>
                            <td><%=listado.getString("NomTipo")%></td>
                            <td><%=listado.getString("puntuacion")%></td>
                            <td><%=listado.getString("estado")%></td>
                        </tr>
                        <%
                           }
                           conexion.close();
                         %>
                    </tbody>
                </table>
            </div>
          </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>

