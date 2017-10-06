<jsp:useBean id="bancodp" class="bancoModel.BancoDP"/>
<jsp:useBean id="bancoad" class="bancoModel.BancoAD"/>

<jsp:setProperty name="bancodp" property="*"/>

<%
if(request.getParameter("bConsultar")==null && request.getParameter("bCapturar")==null)
    {

%>

<html>
   <head>
   	  <title>Catalogo de Clientes</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
   </head>
   <body>
       <div class="container">
            <h1 class="text-center">Catalogo de Clientes</h1>
           <div class="text-center" style="backgroundd-color:#2ba9ec">
                <form action='../beans/Banco.jsp' method='get' class='form-horizontal text-center'>
                    <div class="form-group row">
                        <label class="control-label col-sm-2" for="cuenta">Numero de cuenta:</label>
                        <input class='form-control col-sm-10' id='cuenta' type='text' name='nocta' placeholder='Numero de Cuenta' required>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-2" for="nombre">Nombre:</label>
                        <input class='form-control col-sm-10' id='nombre' type='text' name='nombre' placeholder='Nombre Completo del Cliente' required>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-2" for="tipo">Tipo:</label>
                        <select class="form-control col-sm-4" name="tipo">
                                <option value="Ahorro">Ahorro</option>
                              <option value="Credito">Credito</option>
                              <option value="Hipoteca">Hipoteca</option>
                              <option value="Otro">Otro</option>
                        </select>

                        <label class="control-label col-sm-2" for="saldo">Saldo:</label>
                        <input class='form-control col-sm-4' id='saldo' type='text' name='saldo' placeholder='Saldo de cuenta' required>
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
   bancoad.altaCliente(bancodp);
%>
    
  <jsp:forward page="RespuestaServerBanco.jsp">
  <jsp:param name="op" value="1"/>
  <jsp:param name="datos" value="<%=bancodp.toString()%>"/>

  </jsp:forward>

<%

}
else if(request.getParameter("bConsultar")!=null){
   String respuesta = bancoad.obtenerClientes();
   %>
    
  <jsp:forward page="RespuestaServerBanco.jsp">
  <jsp:param name="op" value="2"/>
  <jsp:param name="datos" value="<%=respuesta%>"/>

  </jsp:forward>

<%
}

%>
