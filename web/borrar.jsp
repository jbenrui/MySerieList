<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
          Statement s = conexion.createStatement();
          Statement a = conexion.createStatement();
          Statement b = conexion.createStatement();
          Statement c = conexion.createStatement();
          
       
          request.setCharacterEncoding("UTF-8");
          String idList = request.getParameter("idList");
          
          ResultSet ConsultaNomList = s.executeQuery("(SELECT * FROM listaserie WHERE idList='"+idList+"')");
          ConsultaNomList.next();
          String NomList = ConsultaNomList.getString("NomList");
          String idGenero = ConsultaNomList.getString("idGenero");
          String idTipo = ConsultaNomList.getString("idTipo");
          
          ResultSet consultaGenero = a.executeQuery("(SELECT * FROM generoprincipal WHERE idGenero='"+idGenero+"')");
          ResultSet consultaTipo = b.executeQuery("(SELECT * FROM tipo WHERE idTipo='"+idTipo+"')");
                                  
         c.execute("DELETE FROM listaserie WHERE IdList='"+idList+"'");
         
         response.sendRedirect("listar.jsp");

    %>
