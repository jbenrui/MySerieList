
<%
  String usuario = request.getParameter("usuario");
  String password = request.getParameter("password");
  
  if (usuario.equals("usuario") && password.equals("usuario")) {
    session.setAttribute("usuario", usuario);
    //response.sendRedirect("listar.jsp?usuario="+usuario);
    response.sendRedirect("listar.jsp");
    
  } else {
    session.setAttribute("error", "Usuario o contraseña incorrecto");
    response.sendRedirect("index.jsp");
  }
%>