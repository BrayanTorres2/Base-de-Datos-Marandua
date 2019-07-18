using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
// LIBRERIA AGREGAR
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;
using CAPAS_CONEXIONES;

namespace CAPAS_LOGICAS
{
    // se pone publica la clase 
   public class CLASE_CLIENTE
    {

    public int cod_clie  {get; set;}
    public int id_clie { get; set; }
    public string tid_clie { get; set; }
    public string nom_clie { get; set;}
    public string ape_clie {get; set;}
    public string cel_clie { get; set; }
    
    public string sentencia;





    //sentencia insertar 
    public void Insertarcliente()
    {
       
            //cuando el tipo de dato es caracter es numerico lo unico que se pone son comillas dobles (")  //llave fk   tipo_identificacion            
            sentencia = "insert into cliente values (" + id_clie + " , '" + tid_clie + "' ,'" + nom_clie + "' , '" + ape_clie + "' ,  '" + cel_clie + "' )";
            CONEXION.ejecutar(sentencia);
        }

    //actualizar
    // VOID NO RETORNA DATOS 
    public void actualizarcliente()
    {
        try
        {

            sentencia = " Update cliente set  id_clie ='" + id_clie + "',tid_clie='" + tid_clie + "',nom_clie = '" + nom_clie + "' , ape_clie = '" + ape_clie + "',cel_clie = '" + cel_clie + "'  where cod_clie = " + cod_clie;
            CONEXION.ejecutar(sentencia);
        }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message, "ERROR");
            }
     
    }
    //consulta general
    public DataTable consultarcliente()
    {

        sentencia = "  select  cod_clie  as CODIGO ,id_clie as IDENTIFICACION ,tid_clie as TIPO_IDENTIFICACION ,nom_clie  as NOMBRE,ape_clie  as APELLIDO, cel_clie  as CELULAR from cliente  ";
        return CONEXION.consultar(sentencia);

        
       
    }


    //consulta especifica 
    //SE PONE DATATABLE PARA QUE DE UN DATO
    public DataTable consultarcodigocliente()
    {

        sentencia = "  select  cod_clie  as CODIGO, id_clie as IDENTIFICACION,tid_clie as TIPO_IDENTIFICACION, nom_clie  as NOMBRE,ape_clie  as APELLIDO,cel_clie  as CELULAR  from cliente where cod_clie  = " + cod_clie;
        return CONEXION.consultar(sentencia);
       
    }

    public DataTable consultarnombrecliente()
    {                                    //EL ALIAS
        sentencia = " select id_clie  as IDENTIFICACION,cod_clie  as CODIGO,nom_clie  as NOMBRE,tid_clie as TIPO_IDENTIFICACION,cel_clie as CELULAR  from cliente where id_clie   = '" + id_clie + "'";
        return CONEXION.consultar(sentencia);
    }
    public DataTable consultarcontenganombre()
    {                                    //EL ALIAS
        sentencia = " select id_clie  as IDENTIFICACION,cod_clie  as CODIGO, nom_clie as NOMBRE,tid_clie as TIPO_IDENTIFICACION,cel_clie as CELULAR  from cliente where id_clie   LIKE '%" + id_clie + "%'";
        return CONEXION.consultar(sentencia);
    }

   

 
            













    }
}
