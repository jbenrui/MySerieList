<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
        Statement c = conexion.createStatement();
        String confirmacion = "del";
        request.setCharacterEncoding("UTF-8");
        String idUser = request.getParameter("idUser");
        c.execute("DELETE FROM usuario WHERE idUser='"+idUser+"'");

       response.sendRedirect("listaUsuarios.jsp?confirmacion="+confirmacion);
       conexion.close();
    %>

