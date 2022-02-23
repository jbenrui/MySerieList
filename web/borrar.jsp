<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
          Statement c = conexion.createStatement();
          request.setCharacterEncoding("UTF-8");
          String idList = request.getParameter("idList");  
          String confirmacion = "del";
         c.execute("DELETE FROM listaserie WHERE IdList='"+idList+"'");
         
        response.sendRedirect("listar.jsp?confirmacion="+confirmacion);
        conexion.close();
    %>
