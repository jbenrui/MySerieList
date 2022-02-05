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
    </head>
    <body>
        <div class="panel panel-default">
            <div class="panel-body">
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
          Statement s = conexion.createStatement();
          
          ResultSet listado = s.executeQuery("SELECT * FROM listaserie JOIN generoprincipal on listaserie.idGenero=generoprincipal.idGenero JOIN tipo on listaserie.idTIPO=tipo.idTipo");
        %>
          <table class="table table-striped">
            <thead>
              <tr>
                <th scope="col">NomList</th>
                <th scope="col">idGenero</th>
                <th scope="col">idTipo</th>
              </tr>
            </thead>
            <tbody>
        <%
          while (listado.next()) {
            %>
            <tr>
                <td><%=listado.getString("NomList")%></td>
                <td><%=listado.getString("NomGenero")%></td>
                <td><%=listado.getString("NomTipo")%></td>
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