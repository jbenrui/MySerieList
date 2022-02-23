<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%
  Class.forName("com.mysql.jdbc.Driver");
  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
  Statement s = conexion.createStatement(); 
  
  String usuario = request.getParameter("usuario");
  String password = request.getParameter("password");
  String confirmacion = ".";
  ResultSet consultaUsuarios = s.executeQuery("(SELECT * FROM usuario WHERE Alias='"+usuario+"')");
  consultaUsuarios.next();
  String Alias = consultaUsuarios.getString("Alias");
  String Contrasena = consultaUsuarios.getString("Contrasena");
  
  if (usuario.equals(Alias) && password.equals(Contrasena)) {
      if ((usuario.equals("root")) && password.equals("root")) {
        session.setAttribute("usuario", usuario);
        response.sendRedirect("listaUsuarios.jsp?confirmacion="+confirmacion);
      }else{
          session.setAttribute("usuario", usuario);
          response.sendRedirect("listar.jsp?confirmacion="+confirmacion);
      }
        
  } else {
    session.setAttribute("error", "Usuario o contraseña incorrecto");
    response.sendRedirect("index.jsp");
  }
  
       conexion.close();

%>