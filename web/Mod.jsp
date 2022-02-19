<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
            Statement s = conexion.createStatement();
            Statement a = conexion.createStatement();
            Statement b = conexion.createStatement();
            
            String NomGenero = request.getParameter("NomGenero");
            String NomTipo = request.getParameter("NomTipo");

            ResultSet consultaGenero = a.executeQuery("SELECT idGenero FROM generoprincipal WHERE NomGenero='"+NomGenero+"'");
          
            ResultSet consultaTipo = b.executeQuery("SELECT idTipo FROM tipo WHERE NomTipo='"+NomTipo+"'");
            
            
            request.setCharacterEncoding("UTF-8");
            consultaGenero.next();
            String idGenero = consultaGenero.getString("idGenero");
            consultaTipo.next();
            String idTipo = consultaTipo.getString("idTipo");
            String mod = "UPDATE listaserie SET "
                    + "NomList=' " + request.getParameter("NomList")
                    + " ', idGenero='" + idGenero
                    + " ', idTipo='" + idTipo
                    + " ', puntuacion='" + request.getParameter("puntuacion") + "'"
                    + " WHERE idList=" + request.getParameter("idList");
            s.execute(mod);
            conexion.close();
            response.sendRedirect("listar.jsp");

%>
