<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./estilo/style.css">
    <title>MySerieList</title>
</head>
<body class="bg-anadirImage bg-opacity">
    <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
          Statement s = conexion.createStatement();
          Statement a = conexion.createStatement();
          Statement b = conexion.createStatement();
          
       
          request.setCharacterEncoding("UTF-8");
          String NomList = request.getParameter("NomList");
          String Genero = request.getParameter("idGenero");
          String usuario = request.getParameter("usuario");
          String idTipo = request.getParameter("idTipo");
          ResultSet ConsultaAdd = s.executeQuery("(SELECT * FROM listaserie WHERE NomList='"+NomList+"')");
          
          ResultSet consultaGenero = a.executeQuery("SELECT * FROM generoprincipal WHERE idGenero='"+Genero+"'");
          
          ResultSet consultaTipo = b.executeQuery("SELECT * FROM tipo WHERE idTipo='"+idTipo+"'");
          
         
    %>
    
    <div class="alert alert-success w-50 mx-auto mt-5" role="alert">
        Ha sido añadido correctamente!
    </div>
    <div id="wrapper" class=" p-5 mx-auto container-fluid ">
        <br>
        <div class="mx-auto shadow p-3 mb-5 color-anadir rounded text-justify bg-anadir">
            <table class="mx-auto w-75 table bg-tablaAnadir tabla-color">
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
                        <td><%=NomList%></td>
                        <td><%consultaGenero.next();
                                out.print(consultaGenero.getString("NomGenero"));
                             %>
                        </td>
                        <td><%consultaTipo.next();
                                out.print(consultaTipo.getString("NomTipo"));
                            %>
                        </td>
                        <td>
                            <a class="btn btn-success" href="listar.jsp">Ver en lista</a>
                        </td>
                    </tr>
                </tbody>
            </table>
            <%
                if (ConsultaAdd.getRow() != 0) {
                        out.println("Lo siento, no se ha podido dar de alta, ya existe un Dato con este código:  "
                        + request.getParameter("idList") + ".");
                    } else {
                     String add = "INSERT INTO listaserie (NomList, idGenero, idTipo ,idUser) VALUES ("
                        + "'" + request.getParameter("NomList")
                        + "', " + request.getParameter("idGenero")
                        + ", '" + request.getParameter("idTipo")
                        + "', '" + session.getAttribute("idUser")
                        + "')";
                     s.execute(add);
                    }
                
            %>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>