
package libroModel;

import java.util.StringTokenizer;

public class LibroDP
{
    // Atributos
    private String titulo,autor,editorial;
    
    // Constructores
    public LibroDP()
    {
    	this.titulo = "";
        this.autor = "";
        this.editorial   = "";
    }
    
    public LibroDP(String datos)
    {
        StringTokenizer st = new StringTokenizer(datos,"_");
        this.titulo =st.nextToken();
        this.autor = st.nextToken();
        this.editorial   = st.nextToken();
    }
    
    // Metodos: Accesors (geter's)
    public String getAutor()
    {
        return this.autor;
    }
    
    public String getTitulo()
    {
        return this.titulo;
    }
    
    public String getEditorial()
    {
        return this.editorial;
    }
    
    // Metodos: Mutators (seter's)
    public void setTitulo(String i){
    	this.titulo = i;
    }
    public void setAutor(String author)
    {
        this.autor = author;
    }
    
    public void setEditorial(String edit)
    {
        this.editorial = edit;
    }
    
    public String toString()
    {
        return this.titulo+"_"+this.autor+"_"+this.editorial;
    }
    
    public String toStringSQL()
    {
        return "'"+this.titulo+"','"+this.autor+"','"+this.editorial+"'";
    }
}
