<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./estilo/style.css">
    <link rel="shortcut icon" href="./imagenes/favicon.ico" type="image/x-icon">
    <title>MySerieList</title>
</head>
<body class="bg-imageRegistro">
    <div id="wrapper" class=" p-5 mx-auto container-fluid text-light">
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
          Statement s = conexion.createStatement();
          String usuario = (String)session.getAttribute("usuario");
          ResultSet listado = s.executeQuery("(SELECT * FROM usuario WHERE Alias != 'null')");
          
          String confirmacion = request.getParameter("confirmacion");
        %>
        <br>
            <div class="card mt-5 mx-auto bg-registro" style="max-width: 540px;">
                <div class="row g-0 ">
                <div class="col-md-4">
                    <img src="imagenes/usuarioPerfil.png" class="img-fluid rounded-circle p-4 " alt="...">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                    <h3 class="card-title">Registrate ya!</h3>
                        <form class="row g-3" action="registro.jsp">
                            <div class="col-md-6">
                            <label for="inputEmail4" class="form-label text-light">Alias</label>
                            <input type="text" name="Alias" class="form-control" id="alias" placeholder="Boketroll300" required>
                            </div>
                            <div class="col-md-6">
                            <label for="inputPassword4" class="form-label text-light">Password</label>
                            <input type="password" name="Contrasena" class="form-control" id="inputPassword4" required>
                            </div>
                            <div>
                            <button type="submit" class="btn btn-primary">Crear Usuario</button>
                            <a href="index.jsp" class="btn btn-primary  m-1">Volver</a>
                            </div>
                        </form>
                    </div>
                </div>
                </div>
            </div>
        
        <br>
         <%
            if (confirmacion.equals("aprobado")){
                    %>
                    <div class="alert mx-auto w-50 alert-success" role="alert">
                        <p>¡Se ha creado el usuario correctamente!</p>
                    </div>
                    <%
            } else if (confirmacion.equals("denegado")){
                %>
                    <div class="alert mx-auto w-50 alert-warning" role="alert">
                        <p>Ya existe un usuario con ese Alias</p>
                    </div>
                <%
            }else{}

            
        %>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
    <%
        conexion.close();
    %>
</html>