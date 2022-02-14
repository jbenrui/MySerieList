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
  
  ResultSet consultaUsuario = s.executeQuery("(SELECT * FROM usuario WHERE Alias='"+usuario+"')");
  consultaUsuario.next();
  
  if (usuario.equals(consultaUsuario.getString("Alias")) && password.equals(consultaUsuario.getString("Contraseña"))) {
    session.setAttribute("usuario", usuario);
    //response.sendRedirect("listar.jsp?usuario="+usuario);
    response.sendRedirect("listar.jsp");
    
  } else {
    session.setAttribute("error", "Usuario o contraseña incorrecto");
    response.sendRedirect("index.jsp");
  }
%>