# MySerieList

## --> Introduccion <--
Como su nombre indica, será una aplicación en la que se podrán añadir, modificar y borrar Series/Peliculas/Documentales... vistas, así como añadir información relevante sobre el mismo. El código utilizado se encuentra en la carpeta CRUD de este repositorio.

La funcionalidad de esta aplicacion es recordarte que series,comics,peliculas... has visto o tienes pendiente por ver. Esta idea me surgio debido a que uno de mis pasatiempos es ver anime y leer mangas. Y he visto tantos que cuando me preguntan amigos o conocidos que les puedo recomendar nunca me acuerdo de las series que vi hace tiempo o con un nombre muy complicado. Y seguro que a mas de una persona le pasa igual, por eso he decido hacer esta aplicacion que recopila todas las series que has visto o tienes pendiente de ver, sea cual sea el tipo.

Para ir entrando en detalles, en la siguiente imagen se puede apreciar el modelo relacional de mi base de datos. En la que los requisitos han sido: De los usuarios necesitare saber el alias y su contraseña, así como el código. De las series y lo relacionado quiero saber el código, el nombre, el genero principal, el tipo , la puntuación y estado.Un usuario solo podrá acceder a su propia lista. El usuario solo puede tener una lista.  Una lista puede tener un usuario como máximo y como mínimo 1.

Puesto que habrán muchos géneros y tipos, he preferido sacarlos como una tabla independiente.

![ModeloRelacional](ModeloRelacionalCrud.png)

### 1º: index/login

Lo primero que  veras al entrar en la aplicacion sera un formulario de Logeo. En el que podras entrar usando el usuario "usuario" y su contraseña correspondiente (usuario). Si los datos son erroneos no te permitira avanzar a la pagina principal. Que en este caso sera el listado de todas las series, peliculas, documentales, mangas, podcasts... Que el usuario ha ido viendo. 

![Login](Login.png)


### 2º: Vista para los Usuarios y Logout
Después de que el usuario haya sido validado, podra ver la lista de sus series y peliculas que tiene, en el caso de no tener podra añadirlas usando el boton añadir. Tambien podra modificar datos y borrar esos datos. En todos los casos pasara por su archivo correspondiente.

![VistaUsuarios](VistaUsuarios.png)

Podemos ver como tambien tenemos 2 botones adicionales, los cuales mas adelante son explicados y podeis ver su funcion mediante las capturas de pantalla.

En el caso de que el usuario quiera cerrar sesion dara click en salir y esta pasara por el archivo logout.jsp enviandolo al index y borrando la variable de sesión.

![Logout](Logout.png)


### 3º: Registro Usuario

Si llega un nuevo usuario y quiere registrarse, presionaria el boton en la pagina de login de registrar y lo llevaria a esta pagina, en la que puede poner su alias y su contraseña. El formulario de registro es algo sencillo. Ademas al ser el Alias UNIQUE en la base de datos, los nombres no podran repetirse, si se crea el usuario con exito este aparece con una alerta.

<div>
  <img height="200" width="400" src="FormularioRegistro.png">
  <img height="200" width="400" src="FormularioRegistroConAlerta.png">
</div>


### 4º: Añadir

Esta parte se activa al introducir datos en el formulario de listar, cuando el usuario presione sobre añadir y previamente con los datos añadidos , se añadira automaticamente y le confirmara que ha sido añadida exitosamente.

<div>
  <img height="200" width="400" src="AddElemento.png">
  <img height="200" width="400" src="AddElementoAlerta.png">
</div>



### 5º: Borrar

Cuando el usuario presione este boton, borrara la linea y un mensaje de que el borrado ha sido exitoso. Este boton es algo peligroso, ya que si pulsas por error no hay vuelta atras.

![BorrarElemento](BorrarElemento.png)

### 6º: Modificar

El usuario al presionar este boton es redirigido a una pagina en la cual podra modificar los datos de la linea previamente seleccionada. En la cual tendra dos botones uno para volver si ha presionado por error y otro para aplicar los cambios,en el que si hace click este aplicara los cambios y lo redigira a la pagina principal de nuevo ademas de mostrarle un mensaje diciendo que los cambios se han producido.

<div>
  <img height="200" width="400" src="ModificarDatos.png">
  <img height="200" width="400" src="ModificarDatosAlerta.png">
</div>

### 7º: Vista de Root

El usuario administrador tendra una lista con todos los usuarios y las contraseñas existentes, ya que en caso de que un usuario no se acuerde de la suya el sera el encargado de modificarla o enviarsela. Ademas tiene el poder de borrar usuarios y modificarlos asi como añadirlos. Tambien cuenta con suspropias alertas. Las cuales funcionan exactamente igual que la de los usuarios.

![VistaRoot](VistaRoot.png)

### 8º: Busqueda por Estado

En este apartado nos encontramos desde la vista del usuario, el cual tiene 2 botones, ver vistos y ver pendientes. El usuario al añadir sus series, pelis , comics etc ... Tambien introduce el estado de estos. Pero claro, si quiere ver la lista de los que aun no ha visto o tiene pendiente de ver es muy tedioso buscarlo en la lista completa, asi que el usuario puede filtrar por pendientes o por vistos usando esos botones. Al presionar los botones los redirige a una pagina en la que pueden ver la informacion, y si quieren volver pueden usar el boton de volver que los lleva de vuelta a la pagina de la lista completa.

<div>
  <img height="200" width="400" src="BusquedaPorPendientes.png">
  <img height="200" width="400" src="BusquedaPorVistos.png">
</div>

### 9º: Alertas.
Las alertas siguen la misma estructura, es un if que dependiendo del valor de la variable confirmacion mostrara un determinado mensaje. Si el valor es "." he decido que no mostraria ningun mensaje. Para que el mensaje desaparezca el usuario debe realizar o bien otra accion, o cerrar sesion. En este caso si opta por realizar otra opcion el valor de confirmacion cambiara  y sera "." . En el caso de modificar si pulsara volver, no apareceria ningun mensaje o si ya habia un mensaje este desaparecera. Aqui se puede apreciar el codigo a grandes rasgos de la estructura seguida. (Todas las alertas funcionan de la misma manera, aunque los mensajes son distintos.)


![](AlertaCodigo.png)
 


### 10º: Buscar.
Los usuarios (no root), podran buscar desde las distintas pestañas (la lista completa, desde la lista de visto y desde la lista de pendientes) el nombre de una serie, peli, manga, etc en concreto. Para ello escribiran el nombre en la barra del buscador y presionaran en buscar. Esta accion los rediregira a una pagina externa en la cual vera la linea de la pelicula en cuestion, si no encuentra nada, no muestra nada.

![](busqueda.png)


### 11º: Video.

https://youtu.be/qteOq5Jl7lw

### Los usuarios que se usan para probar la aplicacion son usuario ( pasword: usuario) y root ( pasword: root). Aunque tambien te recomiendo que pruebes a crear tu propio usuario :D.
