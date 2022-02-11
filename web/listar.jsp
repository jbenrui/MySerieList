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
        <link rel="stylesheet" href="./estilo/style.css">
    </head>
    <body class="bg-listar bg-opacity">
        <div id="wrapper" class="p-5 mx-auto container-fluid panel panel-default bg-listar">
        <div class="panel-body">
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
          Statement s = conexion.createStatement();
          Statement u = conexion.createStatement();
          String usuario = (String)session.getAttribute("usuario");
          ResultSet listado = s.executeQuery("(SELECT * FROM listaserie JOIN generoprincipal on listaserie.idGenero=generoprincipal.idGenero JOIN tipo on listaserie.idTIPO=tipo.idTipo JOIN usuario on listaserie.idUser=usuario.idUser WHERE Alias='"+usuario+"')");
         
          ResultSet consultaIdUser = u.executeQuery("(SELECT * FROM usuario WHERE Alias='"+usuario+"')");
          
        %>
        
        <div class="card mx-auto mb-3" style="max-width: 540px;">
            <%consultaIdUser.next();
                session.setAttribute("idUser", consultaIdUser.getString("idUser"));

                String idUsuario = (String)session.getAttribute("idUser");
            %>
        <div class="row g-0">
          <div class="col-md-4">
            <img src="./imagenes/Login/usuarioPerfil.png" class="img-fluid rounded-start" alt="...">
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
        <div>
            <table class="mx-auto w-75 table table-dark table-striped">
                <thead>
                    <tr>
                    <th scope="col"></th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Genero</th>
                    <th scope="col">Tipo</th>
                    <th scope="col">Modificar</th>
                    <th scope="col">Acciones</th>
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
                        <td>...</td>
                        <td>
                            <form method="get" action="borrar.jsp">
                                <input type="hidden" name="idList" value="<%=listado.getString("idList")%>"/>
                                <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Borrar</button>
                            </form>
                        </td>
                    </tr>
                    <%
                       }
                       conexion.close();
                     %>
                </tbody>
            </table>

            <table class="mx-auto w-75 table table-dark table-striped ">
                <thead>
                    <tr>
                    <th scope="col"></th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Genero</th>
                    <th scope="col">Tipo</th>
                    <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <form action="anadir.jsp">
                    <tr>
                    <th scope="row"></th>
                        <td>
                            <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" name="NomList" >

                        </td>
                        <td>
                            <select id="Genero" class="form-select" name="idGenero" aria-required="true">
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
                            <select id="Tipo" class="form-select" name="idTipo" aria-required="true">
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

                          <button class="btn btn-info btn-block" type="submit">Añadir</button>
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