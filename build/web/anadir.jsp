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
          
       
          request.setCharacterEncoding("UTF-8");
          String NomList = request.getParameter("NomList");
          String Genero = request.getParameter("idGenero");
          String idTipo = request.getParameter("idTipo");
          ResultSet ConsultaAdd = s.executeQuery("(SELECT * FROM listaserie WHERE NomList='"+NomList+"')");
          
          
            if (ConsultaAdd.getRow() != 0) {
                    out.println("Lo siento, no se ha podido dar de alta, ya existe un Dato con este código:  "
                    + request.getParameter("idList") + ".");
                } else {
                 String add = "INSERT INTO listaserie (NomList, idGenero, idTipo ,idUser) VALUES ("
                    + "'" + request.getParameter("NomList")
                    + "', " + request.getParameter("idGenero")
                    + ", '" + request.getParameter("idTipo")
                    + ", '" + session.getAttribute("idUser")
                    + "', '" + request.getParameter("puntuacion")
                    + "')";
                 s.execute(add);
                }
                response.sendRedirect("listar.jsp");
     
    %>