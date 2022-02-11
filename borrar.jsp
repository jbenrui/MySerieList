<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./estilo/style.css">
    <title>MySerieList</title>
</head>
<body class="bg-borrarImage bg-opacity">
    <div class="alert alert-danger w-50 mx-auto mt-5" role="alert">
        Ha sido borrado con exito!
    </div>
    <div id="wrapper" class=" p-5 mx-auto container-fluid ">
        <br>
        <div class="mx-auto shadow p-3 mb-5 color-borrar rounded text-justify bg-borrar">
            <table class="mx-auto w-75 table bg-tablaBorrar tabla-borrar">
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
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>
                            <a class="btn btn-warning" href="listar.jsp">Ver en lista</a>
                        </td>
                    </tr>
                </tbody>
            </table>
            
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>