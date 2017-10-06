<%@ page import="java.util.StringTokenizer" %>

<%
String datos = request.getParameter("datos");
String nocta=request.getParameter("nocta");
String nombre=request.getParameter("nombre");
String tipo=request.getParameter("tipo");
String saldo = request.getParameter("saldo");
String opcion = request.getParameter("op");
StringTokenizer tokenizer = new StringTokenizer(datos,"*");
%>
<%!
    private void funcWrite(String Bits, javax.servlet.jsp.JspWriter myOut)
    {  
      try{ myOut.println(Bits); } 
      catch(Exception eek) { }
    }
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
          <p>EL cliente <%= nombre%> con numero de cuenta <%= nocta%> de tipo <%= tipo%> con saldo <%= saldo%> fue registrado con exito! Esperemos que registre otro cliente pronto!</p>
        </div>
        <div class="text-center">
            <form action="../beans/Banco.jsp">
                <input type="submit" class="btn btn-success" value="Regresar a la pagina principal" />
            </form>
        </div>
        
    </div>
<%
   }else if(opcion.equals("2")){
   %>
    <head>
   	    <title>Consulta de Clientes</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
   </head>
   <body>
    <div class="container">
        <h1 class="text-center">Consulta de Clientes</h1>
        <br>
       <table class="table table-hover">
            <thead class="thead-default">
                <tr>
                    <th>No. de Cuenta</th>
                    <th>Nombre</th>
                    <th>Tipo</th>
                    <th>Saldo</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int number = tokenizer.countTokens();
                    for(int i=0;i<number;i++){
                        StringTokenizer secondTokenizer = new StringTokenizer(tokenizer.nextToken(),"_");
                        nocta=secondTokenizer.nextToken();
                        nombre=secondTokenizer.nextToken();
                        tipo=secondTokenizer.nextToken();
                        saldo = secondTokenizer.nextToken();     
                        funcWrite("<tr>",out);
                        funcWrite("<th scope='row'>"+nocta+"</th>",out);
                        funcWrite("<td>",out);
                        funcWrite(nombre,out);
                        funcWrite("</td>",out);
                        funcWrite("<td>"+tipo+"</td>",out);
                        funcWrite("<td>"+saldo+"</td>",out);
                        funcWrite("</tr>",out);
                    }
                %>
            </tbody>
        </table>
        
    </div>
<%
   }
   %>
</html>
