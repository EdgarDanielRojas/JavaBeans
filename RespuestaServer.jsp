<jsp:useBean id="librodp" class="libroModel.LibroDP"/>
<jsp:setProperty name="librodp" property="*" />

<%
String datos = request.getParameter("datos");
String titulo=request.getParameter("titulo");
String autor=request.getParameter("autor");
String editorial=request.getParameter("editorial");
String opcion = request.getParameter("tipo");
%>

<html>
<%
   if(opcion.equals("1")){
%>
   <head>
   	    <title>Registro Exitoso!</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
   </head>
   <body>
    <div class="container">
        <br>
       <div class="alert alert-success" role="alert">
          <h4 class="alert-heading">Muy bien!</h4>
          <p>EL libro <%= titulo%> con autor <%= autor%> de la editorial <%= editorial%> fue registrado con exito! Esperemos que registre otro libro pronto!</p>
        </div>
        <div class="text-center">
            <form action="../beans/libros.jsp">
                <input type="submit" class="btn btn-success" value="Regresar a la pagina principal" />
            </form>
        </div>
        
    </div>
<%
   }else if(opcion.equals("2")){
   %>
    <head>
   	    <title>Consulta de Catalogo</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
   </head>
   <body>
    <div class="container">
        <br>
       <div class="alert alert-success" role="alert">
          <h4 class="alert-heading">Muy bien!</h4>
          <p>EL libro <%= datos%> con autor <%= autor%> de la editorial <%= editorial%> fue registrado con exito! Esperemos que registre otro libro pronto!</p>
        </div>
        <div class="text-center">
            <form action="../beans/libros.jsp">
                <input type="submit" class="btn btn-success" value="Regresar a la pagina principal" />
            </form>
        </div>
        
    </div>
<%
   }
   %>
</html>
