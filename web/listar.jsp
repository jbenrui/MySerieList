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
          
          ResultSet listado = s.executeQuery("SELECT * FROM listaserie JOIN generoprincipal on listaserie.idGenero=generoprincipal.idGenero JOIN tipo on listaserie.idTIPO=tipo.idTipo");
        %>
        <table class="mx-auto w-75 table table-dark table-striped">
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
            <%
                 while (listado.next()) {
            %>
                <tr>
                <th scope="row"></th>
                    <td><%=listado.getString("NomList")%></td>
                    <td><%=listado.getString("NomGenero")%></td>
                    <td><%=listado.getString("NomTipo")%></td>
                    <td>
                        <a class="btn btn-success" href="añadir.jsp">Modificar</a>
                        <a class="btn btn-danger" href="borrar.jsp" >Borrar</a>
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
                <tr>
                <th scope="row"></th>
                    <td>
                        <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" name="NomList">
                    </td>
                    <td>
                        <input type="text" class="form-control" placeholder="Genero" aria-label="Genero" name="NomGenero">
                    </td>
                    <td>
                        <input type="text" class="form-control" placeholder="Tipo" aria-label="Tipo" name="NomTipo">
                    </td>
                    <td>
                   
                      <a class="btn btn-info" href="añadir.jsp" >Añadir</a>
                    </td>
                </tr>
            </tbody>
            </table>
          </div>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>