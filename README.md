# MySerieList
Como su nombre indica, será una aplicación en la que se podrán añadir, modificar y borrar Series/Peliculas/Documentales... vistas, así como añadir información relevante sobre el mismo. El código utilizado se encuentra en la carpeta CRUD de este repositorio.

La funcionalidad de esta aplicacion es recordarte que series,comics,peliculas... has visto. Esta idea me surgio debido a que uno de mis pasatiempos es ver anime y leer mangas. Y he visto tantos que cuando me preguntan amigos o conocidos que les puedo recomendar nunca me acuerdo de las series que vi hace tiempo o con un nombre muy complicado. Y seguro que a mas de una persona le pasa igual, por eso he decido hacer esta aplicacion estilo "diario" o "lista".

### 1º: index/login

Lo primero que  veras al entrar en la aplicacion sera un formulario de Logeo. En el que podras entrar usando el usuario "usuario" y su contraseña correspondiente (usuario). Si los datos son erroneos no te permitira avanzar a la pagina principal. Que en este caso sera el listado de todas las series, peliculas, documentales, mangas, podcasts... Que el usuario ha ido viendo. 

![](Login.png)

El codigo que he usado en para validar el Login es el siguiente, el index pasa primero por este archivo (login.jsp) y valida que el usuario existe y guarda el parametro en una variable de sesion para despues de ser validado enviarme a la pagina del listado.

![](ValidadorDeLogin.png)

### 2º: Listado y Logout
