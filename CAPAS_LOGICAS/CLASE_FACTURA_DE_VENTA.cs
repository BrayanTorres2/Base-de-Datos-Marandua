using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using CAPAS_CONEXIONES;

namespace CAPAS_LOGICAS
{
   public class CLASE_FACTURA_DE_VENTA
    {
       public int  cod_fv  { get; set; }
       public string fec_fv { get; set; }
       public int cod_clie { get; set; }
       public int cod_emp { get; set; }
       
     

       public string sentencia;
       
       public void Insertarfacturadeventa()
       {
           //cuando el tipo de dato es caracter es numerico lo unico que le quito es comilla simple (') 
           //llave fk
           sentencia = "insert into factura_de_venta values (" + cod_fv + " ,'" + fec_fv + "'," + cod_clie + " , " + cod_emp + ")";
           CONEXION.ejecutar(sentencia);
       }


       //actualizar
       // VOID NO RETORNA DATOS 
       public void actualizarfacturadeventa()
       {                        //nombre de la tabla    campos                                                

           sentencia = " Update factura_de_venta set cod_fv = '" + cod_fv + "' ,fec_fv = '" + fec_fv + "', cod_clie = '" + cod_clie + "' ,cod_emp= '" + cod_emp + "' where cod_fv = " + cod_fv;
           CONEXION.ejecutar(sentencia);




       }
       //consulta general
       public DataTable consultarfacturafeventa()
       {

           sentencia = "  select  cod_fv  as CODIGO ,fec_fv as Fecha ,cod_clie  as CLIENTE,cod_emp as EMPLEADO from factura_de_venta ";
           return CONEXION.consultar(sentencia);

       }


       //consulta especifica 
       //SE PONE DATATABLE PARA QUE DE UN DATO
       public DataTable consultarcodigofacturadeventa()
       {

           sentencia = "  select  cod_fv  as CODIGO, fec_fv as Fecha, cod_clie as CLIENTE,cod_emp as EMPLEADO from factura_de_venta where cod_fv  = " + cod_fv;
           return CONEXION.consultar(sentencia);
       }

       public DataTable consultarfechafacturadeventa()
       {                                    //EL ALIAS
           sentencia = " select fec_fv as Fecha,cod_fv as CODIGO, cod_clie as CLIENTE, cod_emp as EMPLEADO from factura_de_venta where fec_fv  = '" + fec_fv + "'";
           return CONEXION.consultar(sentencia);


       }

       public void eliminarusuario()
       {
           sentencia = "  delete from empleado where cod_fv  = " + cod_fv;
           CONEXION.ejecutar(sentencia);

       }

    }
}
