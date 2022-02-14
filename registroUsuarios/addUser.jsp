<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RegistroUsuario</title>
    </head>
    <body>
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
          Statement s = conexion.createStatement();
          Statement d = conexion.createStatement();
          
          String usuario = request.getParameter("newUser");
          String password = request.getParameter("newPassword");
          
          ResultSet consultaUsuarios = d.executeQuery("(SELECT * FROM usuario WHERE Alias='"+usuario+"')");
          
          if (consultaUsuarios.getRow() != 0) {
                        out.println("Lo siento, no se ha podido dar de alta, ya existe un Dato con este código:  "
                        + request.getParameter("Alias") + ".");
                    } else {
                     String add = "INSERT INTO usuario (Alias, Contraseña) VALUES ("
                        + "'" + usuario
                        + "', '" + password
                        + "')";
                     s.execute(add);
                    }
        %>
        
    </body>
</html>
