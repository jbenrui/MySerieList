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
    <link rel="stylesheet" href="./estilo/estilo.css">
    <title>Tablas</title>
</head>
<body class="bg-listar bg-opacity">
    <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
          Statement s = conexion.createStatement();
          
       
          request.setCharacterEncoding("UTF-8");
          String NomList = request.getParameter("NomList");
          String Genero = request.getParameter("idGenero");
          String NomTipo = request.getParameter("NomTipo");
          
          ResultSet consultaNomList = s.executeQuery("SELECT * FROM listaserie WHERE NomList='"+Genero+"'");
          
          
          if (consultaNomList.getRow() != 0) {
                out.println("Lo siento, no se ha podido dar de alta, ya existe juego con este código:  "
                        + request.getParameter("idList") + ".");
            } else {
                String insercion = "INSERT INTO listaserie (NomList, idGenero, idTipo) VALUES ("
                        + "'" + request.getParameter("NomList")
                        + "', " + request.getParameter("idGenero")
                        + ", '" + request.getParameter("idTipo")
                        + "')";
                s.execute(insercion);
            }
          
            conexion.close();
    %>
        <div class="alert alert-success" role="alert">
            Objeto añadido correctamente a la lista.
        </div>
    
        
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>