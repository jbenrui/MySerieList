<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./estilo/style.css">
    <title>MySerieList</title>
</head>
<body class="bg-fondoCrudImagen">
    <div id="wrapper" class="container-fluid position-absolute top-50 start-50 translate-middle">
        <div class="table-responsive m-auto shadow w-75 p-3 mb-5 color-anadir rounded text-justify bg-fondoCrud">
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserieslist","root", "");
                Statement s = conexion.createStatement();

                request.setCharacterEncoding("UTF-8");
                String idList = request.getParameter("idList");
                String NomList = request.getParameter("NomList");
                String NomGenero = request.getParameter("NomGenero");
                String NomTipo = request.getParameter("NomTipo");
                String puntuacion = request.getParameter("puntuacion");
                
                
            %>
            
            
            <table class="mx-auto w-75 table bg-tablaCrud color-texto">
                <thead>
                    <tr>
                    <th scope="col"></th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Genero</th>
                    <th scope="col">Tipo</th>
                    <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <th scope="row"></th>
                        <form action="Mod.jsp">
                    <tr>
                    <th scope="row"></th>
                        <td>
                          <input type="hidden" class="form-control" placeholder="Nombre" aria-label="Nombre" value="<%=idList%>" name="idList" >
                          <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" value="<%=NomList%>" name="NomList" >
                        </td>
                        <td>
                            <select id="Genero" class="form-select" name="NomGenero" aria-required="true">
                            <option selected><%=NomGenero%></option>
                            <option value="Comedia">Comedia</option>
                            <option value="Accion">Accion</option>
                            <option value="Ciencia Ficcion">Ciencia Ficcion</option>
                            <option value="Drama">Drama</option>
                            <option value="Romance">Romance</option>
                            <option value="Terror">Terror</option>
                            <option value="Aventura">Aventura</option>
                            <option value="Deportes">Deportes</option>
                            <option value="Fantasia">Fantasia</option>
                            <option value="Historico">Historico</option>
                            </select>
                        </td>
                        <td>
                            <select id="Tipo" class="form-select" name="NomTipo" aria-required="true">
                                <option selected><%=NomTipo%></option>
                                <option value="Pelicula">Pelicula</option>
                                <option value="Serie">Serie</option>
                                <option value="Anime">Anime</option>
                                <option value="Manga">Manga</option>
                                <option value="Life Action">Life Action</option>
                                <option value="Comic">Comic</option>
                                <option value="Documental">Documental</option>
                                <option value="Podcast">Podcast</option>
                                </select>
                        </td>
                        <td>
                            <select id="valoracion" class="form-select" name="puntuacion" aria-required="true">
                                <option selected><%=puntuacion%></option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                </select>
                        </td>
                        <td>
                          <button class="btn btn-color color-texto btn-block" type="submit"><i class="bi bi-pencil"></i>Modificar</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
