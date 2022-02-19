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
        <title>MySerieList</title>
    </head>
    <body class="bg-fondoCrudImagen">
        <div id="wrapper" class="p-5 mx-auto container-fluid panel panel-default bg-fondoCrudImagen">
            <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
          Statement s = conexion.createStatement();
          Statement u = conexion.createStatement();
          String usuario = (String)session.getAttribute("usuario");
          ResultSet listado = s.executeQuery("(SELECT * FROM listaserie JOIN generoprincipal on listaserie.idGenero=generoprincipal.idGenero JOIN tipo on listaserie.idTIPO=tipo.idTipo JOIN usuario on listaserie.idUser=usuario.idUser WHERE Alias='"+usuario+"')");
         
          ResultSet consultaIdUser = u.executeQuery("(SELECT * FROM usuario WHERE Alias='"+usuario+"')");
          
        %>
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
            </div>
          </div>
        </div>
      </div>
        <div class=" mx-auto shadow p-3 mb-5 color-anadir rounded text-justify table-responsive bg-fondoCrud">
            <table class="mx-auto w-100 table bg-tablaCrud color-texto">
                <thead>
                    <tr>
                    <th scope="col"></th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Genero</th>
                    <th scope="col">Tipo</th>
                    <th scope="col">Valoración</th>
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
                        <td><%=listado.getString("NomList")%></td>
                        <td><%=listado.getString("NomGenero")%></td>
                        <td><%=listado.getString("NomTipo")%></td>
                        <td><%=listado.getString("puntuacion")%></td>
                        <td>
                            <form method="get" action="modificar.jsp">
                                <input type="hidden" name="idList" value="<%=listado.getString("idList")%>">
                                <input type="hidden" name="NomList" value="<%=listado.getString("NomList")%>">
                                <input type="hidden" name="NomGenero" value="<%=listado.getString("NomGenero")%>">
                                <input type="hidden" name="NomTipo" value="<%=listado.getString("NomTipo")%>">
                                <input type="hidden" name="puntuacion" value="<%=listado.getString("puntuacion")%>">
                                <button type="submit"  class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span><i class="bi bi-pencil"></i> Modificar</button>
                            </form>
                        </td>
                        <td>
                            <form method="get" action="borrar.jsp">
                                <input type="hidden" name="idList" value="<%=listado.getString("idList")%>"/>
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

            <table class="mx-auto w-100 table bg-tablaCrud color-texto ">
                <thead>
                    <tr>
                    <th scope="col"></th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Genero</th>
                    <th scope="col">Tipo</th>
                    <th scope="col">Valoración</th>
                    <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <form action="anadir.jsp">
                    <tr>
                    <th scope="row"></th>
                        <td>
                            <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" name="NomList" required>

                        </td>
                        <td>
                            <select id="Genero" class="form-select" name="idGenero" aria-required="true" required>
                            <option selected>Elige...</option>
                            <option value="1">Comedia</option>
                            <option value="2">Acción</option>
                            <option value="3">Ciencia Ficcion</option>
                            <option value="4">Drama</option>
                            <option value="5">Romance</option>
                            <option value="6">Terror</option>
                            <option value="7">Aventura</option>
                            <option value="8">Deportes</option>
                            <option value="9">Fantasia</option>
                            <option value="10">Historico</option>
                            </select>
                        </td>
                        <td>
                            <select id="Tipo" class="form-select" name="idTipo" aria-required="true" required>
                                <option selected>Elige...</option>
                                <option value="1">Pelicula</option>
                                <option value="2">Serie</option>
                                <option value="3">Anime</option>
                                <option value="4">Manga</option>
                                <option value="5">Life Action</option>
                                <option value="6">Comic</option>
                                <option value="7">Documental</option>
                                <option value="8">Podcast</option>
                                </select>
                        </td>
                        <td>
                            <select id="valoracion" class="form-select" name="puntuacion" aria-required="true">
                                <option selected>Valora...</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                </select>
                        </td>
                        <td>

                          <button class="btn btn-info btn-block" type="submit"><i class="bi bi-plus-circle-fill"> </i>Añadir</button>
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