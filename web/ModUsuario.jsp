<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
        Statement s = conexion.createStatement();
        
        String confirmacion = "mod";
        request.setCharacterEncoding("UTF-8");
        String mod = "UPDATE usuario SET "
                + "Alias='" + request.getParameter("Alias")
                + "', Contrasena='" + request.getParameter("Contrasena") + "'"
                + " WHERE idUser=" + request.getParameter("idUser");
        s.execute(mod);
        conexion.close();
        response.sendRedirect("listaUsuarios.jsp?confirmacion="+confirmacion);
        //response.sendRedirect("listaUsuarios.jsp");
%>

