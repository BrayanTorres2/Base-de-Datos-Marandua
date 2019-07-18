using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//AGREGAR
using System.Data;
using CAPAS_CONEXIONES;


namespace CAPAS_LOGICAS
{
   public class CLASE_FACTURA_COMPRA

    {

        public int cod_fc {get;set;}
        public string fec_fc {get;set;}
       //LLAVE FK EMPLEADO 
        public int cod_emp { get; set; }
       //LLAVE FK PROVEEDOR
        public int cod_prov {get;set;}
       

       public string sentencia;
 
           //sentencia insertar 
       
       public void insertarfacturacompra()
       {
   
           sentencia = " insert into factura_compra values ("+ cod_fc +" ,'" + fec_fc + "' ," +cod_emp +" ,"+ cod_prov +")";
           CONEXION.ejecutar(sentencia);
       }
        

       public void actualizarfacturacompra()
       {
           sentencia = " update factura_compra set cod_fc = '" + cod_fc + "' ,fec_fc = '" + fec_fc + "',cod_emp = '" + cod_emp + "', cod_prov = '" + cod_prov + "' where cod_fc = " + cod_fc;
       }

        //consulta general
       public DataTable consultarfacturacompra()
       {
           sentencia = " select cod_fc as CODIGO,fec_fc as FECHA,cod_emp as EMPLEADO,cod_prov as PROVEEDOR from factura_compra "; 
           return CONEXION.consultar (sentencia);
       }
      //consutla especifica 
       public DataTable consultarcodigofacturacompra()
       {
           sentencia = " select cod_fc as CODIGO,fec_fc as FECHA,cod_emp as EMPLEADO,cod_prov as PROVEEDOR from factura_compra  where cod_fc = " + cod_fc ;
           return CONEXION.consultar(sentencia);
       }

       public DataTable consultarfechafacturacompra()
       {
           sentencia = " select fec_fc as FECHA,codigo as CODIGO ,cod_emp as EMPLEADO,cod_prov as PROVEEDOR  from factura_compra where fec_fc = '" + fec_fc + "'";
           return CONEXION .consultar (sentencia);
       }


    }


 }

