<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<body class="bg-images">
    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");

    %>
    <div id="wrapper" class="container mx-auto p-5  bg-negro position-absolute top-50 start-50 translate-middle">
            <form action="login.jsp">
                <div class="m-2">
                <label for="usuario" class="form-label text-light">Introduce tu Alias</label>
                <input type="text" class="form-control " name="usuario" required>
                <div id="alias" class="form-text text-light">No se compartira tu alias, ni email con nadie.</div>
                </div>
                <div class="m-2">
                <label for="exampleInputPassword1" class="form-label text-light">Password</label>
                <input type="password" class="form-control" name="password" required>
                </div>
                <button class="btn btn-primary btn-block m-1" type="submit">Iniciar Sesion</button>
                <a href="registroUsuario.jsp" class="btn btn-primary  m-1">Registrarte</a>
            </form>
                
        
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
</body>
</html>