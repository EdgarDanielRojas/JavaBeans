
package bancoModel;

import java.util.StringTokenizer;

public class BancoDP
{
    // Atributos
    private String nocta,nombre,tipo,saldo;
    
    // Constructores
    public BancoDP()
    {
    	this.nocta = "";
        this.nombre = "";
        this.tipo   = "";
        this.saldo = "";
    }
    
    public BancoDP(String datos)
    {
        StringTokenizer st = new StringTokenizer(datos,"_");
        this.nocta =st.nextToken();
        this.nombre = st.nextToken();
        this.tipo   = st.nextToken();
        this.saldo= st.nextToken();
    }
    
    // Metodos: Accesors (geter's)
    public String getNocta()
    {
        return this.nocta;
    }
    
    public String getNombre()
    {
        return this.nombre;
    }
    
    public String getTipo()
    {
        return this.tipo;
    }
    
    public String getSaldo(){
    	return this.saldo;
    }
    
    // Metodos: Mutators (seter's)
    public void setNocta(String i){
    	this.nocta = i;
    }
    public void setNombre(String a)
    {
        this.nombre = a;
    }
    
    public void setTipo(String e)
    {
        this.tipo = e;
    }
    
    public void setSaldo(String e)
    {
        this.saldo = e;
    }
    
    public String toString()
    {
        return this.nocta+"_"+this.nombre+"_"+this.tipo+"_"+this.saldo;
    }
    
    public String toStringSQL()
    {
        return ""+this.nocta+",'"+this.nombre+"','"+this.tipo+"',"+this.saldo+"";
    }
}
