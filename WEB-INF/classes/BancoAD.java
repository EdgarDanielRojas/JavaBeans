package bancoModel;

import java.io.PrintWriter;
import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.FileReader;
import java.io.IOException;
import java.io.FileNotFoundException;
import java.util.StringTokenizer;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class BancoAD
{
    private Connection conexion;
    private Statement statement;
    
    private BancoDP baancodp;
    private String error="none";
    public BancoAD()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/banco?user=root");
            System.out.println("Conexion exitosa a la BD en MySQL...");
        }
        catch(ClassNotFoundException cnfe)
        {
            System.out.println("Error: "+cnfe);
            error="Found 1";
        }
        catch(InstantiationException ie)
        {
            System.out.println("Error: "+ie);
            error="Found 2";
        }
        catch(IllegalAccessException iae)
        {
            System.out.println("Error: "+iae);
            error="Found 3";
        }
        catch(SQLException sqle)
        {
            System.out.println("Error: "+sqle);
            error="Found 4";
        }
    }
    
    public void altaCliente(BancoDP banco){
    	String resultado;
    	String insert = "INSERT INTO cliente VALUES("+banco.toStringSQL()+");";
    	try{
    	statement = conexion.createStatement();
    	statement.executeUpdate(insert);
    	statement.close();
    	resultado = "Captura correcta";
    	System.out.println(conexion.nativeSQL(insert));
    	}
    	catch(SQLException ioe){
    		System.out.println("Error: " + ioe);
    		resultado = "Error en captura";
    	}
    }
    
    public String obtenerClientes(){
    	String datos="";
    	String info="";
        String query;
        ResultSet tr;
        boolean encontrado=false;
        
        query = "SELECT * FROM cliente;";
        try
        {
            statement = conexion.createStatement();
            tr = statement.executeQuery(query);
            while(tr.next())
            {
                info=tr.getString("nocta");
                info=info+"_"+tr.getString("nombre");
               	info=info+"_"+tr.getString("tipo");
               	info=info+"_"+tr.getString("saldo");
                
                datos = datos + info+ "*";
                
                encontrado = true;
            }
            statement.close();
            
            System.out.println(conexion.nativeSQL(query));
        }
        catch(SQLException sqle)
        {
            datos = "ERROR";
            System.out.println("Error: "+sqle);
        }
        
        if(!encontrado)
            datos = "NO_LOCALIZADO";
        
        return datos;
    }
    
}