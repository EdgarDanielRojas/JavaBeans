<jsp:useBean id="librodp" class="libroModel.LibroDP"/>
<jsp:useBean id="libroad" class="libroModel.LibroAD"/>

<jsp:setProperty name="librodp" property="*"/>

<%
if(request.getParameter("bConsultar")==null && request.getParameter("bCapturar")==null)
    {

%>

<html>
   <head>
   	  <title>Catalogo de Libros</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
   </head>
   <body>
       <div class="container">
            <h1 class="text-center">Catalogo de Libros</h1>
           <div class="text-center" style="backgroundd-color:#2ba9ec">
                <form action='../beans/libros.jsp' method='get' class='form-horizontal text-center'>
                    <div class="form-group row">
                        <label class="control-label col-sm-1" for="titulo">Titulo:</label>
                        <input class='form-control col-sm-10' id='titulo' type='text' name='titulo' placeholder='Titulo del libro' required>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-1" for="autor">Autor:</label>
                        <input class='form-control col-sm-10' id='autor' type='text' name='autor' placeholder='Autor del libro' required>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-1" for="editorial">Editorial:</label>
                        <input class='form-control col-sm-10' id='editorial' type='text' name='editorial' placeholder='Editorial del libro' required>
                    </div>
                    <br>
                    <div class="text-center">
                        <input class="btn btn-primary" type='submit' name='bCapturar' value='Capturar Datos'>
                        <input class="btn btn-primary" type='submit' name='bConsultar' value='Consultar Libros' formnovalidate>
                    </div>
                </form>
           </div> 
        </div>
   </body>
</html>

<% }

else if(request.getParameter("bCapturar")!=null){
   libroad.altaLibro(librodp);
%>
    
  <jsp:forward page="RespuestaServer.jsp">
  <jsp:param name="tipo" value="1"/>
  <jsp:param name="datos" value="<%=librodp.toString()%>"/>

  </jsp:forward>

<%

}
else if(request.getParameter("bConsultar")!=null){
   String respuesta = libroad.obtenerLibros();
   %>
    
  <jsp:forward page="RespuestaServer.jsp">
  <jsp:param name="tipo" value="2"/>
  <jsp:param name="datos" value="<%=respuesta%>"/>

  </jsp:forward>

<%
}

%>
