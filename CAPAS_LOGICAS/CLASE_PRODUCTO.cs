using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//AGREGAR A LIBRERIA
using System.Data;
using CAPAS_CONEXIONES;

namespace CAPAS_LOGICAS
{
    // se pone publica la clase 
   public class CLASE_PRODUCTO
    {
       public int cod_prod { get; set; }
       public string nom_prod { get; set; }
       public int sto_prod { get; set; }
       public int pre_prod { get; set; }
       public int cod_cat { get; set; }

       public string sentencia;

       //sentencia insertar 
       public void Insertarproducto()
       {
           //cuando el tipo de dato es caracter es numerico lo unico que le quito es comilla simple (') 
           //llave fk
           sentencia = "insert into producto values (" + cod_prod + " , '" + nom_prod + "' ,"+cod_cat+ ", " + sto_prod + " , " + pre_prod+ " )";
           CONEXION.ejecutar(sentencia);
       }

       //actualizar
       // VOID NO RETORNA DATOS 
       public void actualizarproducto()
       {                        //nombre de la tabla    campos                                                

           sentencia = " Update producto set nom_prod ='" + nom_prod + "',cod_cat='"+cod_cat+"',cod_prod = '" + cod_prod + "',sto_prod ='" + sto_prod + "' ,pre_prod = '" + pre_prod + "' where cod_prod = " + cod_prod;
           CONEXION.ejecutar(sentencia);

            
       }
       //consulta general
       public DataTable consultarproducto()
       {

           sentencia = "  select  cod_prod   as CODIGO  ,nom_prod  as NOMBRE,cod_cat as CATEGORIA, sto_prod as CANTIDAD,pre_prod as PRECIO from producto ";
           return CONEXION.consultar(sentencia);

       }


       //consulta especifica 
       //SE PONE DATATABLE PARA QUE DE UN DATO
       public DataTable consultarcodigoproducto()
       {

           sentencia = "  select  cod_prod  as CODIGO, nom_prod  as NOMBRE,cod_cat as CATEGORIA,sto_prod as CANTIDAD,pre_prod as PRECIO from producto where cod_prod  = " + cod_prod;
           return CONEXION.consultar(sentencia);
       }

       public DataTable consultarnombreproducto()
       {                                    //EL ALIAS
           sentencia = " select nom_prod as NOMBRE,cod_cat as CATEGORIA,cod_prod as CODIGO, nom_prod  as NOMBRE,sto_prod as CANTIDAD,pre_prod as PRECIO from producto where nom_prod = '" + nom_prod + "'";
           return CONEXION.consultar(sentencia);


       }


    }
}
