<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
    <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
          Statement s = conexion.createStatement();

          request.setCharacterEncoding("UTF-8");
          String alias = request.getParameter("Alias");
          String password = request.getParameter("Contrasena");
          
         ResultSet consultaUsuario = s.executeQuery("(SELECT COUNT(*) AS numUser FROM usuario WHERE Alias='"+alias+"')");
          

          if (consultaUsuario.getRow() == 0) {
              String add = "INSERT INTO usuario (Alias,contrasena) VALUES ("
                    + "'" + alias
                    + "', '" + password
                    + "')";
                 s.execute(add);
                String confirmacion="aprobado";
                response.sendRedirect("registroUsuario.jsp?confirmacion="+confirmacion);
                } else {
                    String confirmacion="denegado";
                    response.sendRedirect("registroUsuario.jsp?confirmacion="+confirmacion);
                }
                
     
    %>