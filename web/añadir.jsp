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
          String Genero = request.getParameter("NomGenero");
          String NomTipo = request.getParameter("NomTipo");
          
          ResultSet listaGenero = s.executeQuery("SELECT * FROM generoprincipal WHERE NomGenero='Genero'");
          
          
        %>
        
        <%=idGenero.getInt("NomGenero")%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>