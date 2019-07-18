using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//agregar 
using System.Data;
using CAPAS_CONEXIONES;

namespace CAPAS_LOGICAS
{
    public class CLASE_DETALLE_FACTURA_COMPRA
    {
        public int cod_dfc { get; set; }
        public int can_dfc { get; set; }
        //LLAVE FK FACTURA COMPRA
        public int cod_fc { get; set; }
        //LLAVE FK PRODUCTO 
        public int cod_prod { get; set; }
        public string nom_prod { get; set; }
        public int sto_prod { get; set; }

        public int tt_fv;
         

        public string sentencia;

        //sentencia insertar 



        public void insertardetallefacturacompra()
        {
            //cuando el tipo de dato es caracter es numerico lo unico que le quito es comilla simple (') 
            //llave fk
            sentencia = "insert into detalle_factura_compra values (" + cod_dfc + " ," + can_dfc + " , " + cod_fc + " , " + cod_prod + ")";
            CONEXION.ejecutar(sentencia);
        }

          public void actualizardetallefacturacompra()
          {
              sentencia = " update detalle_factura_compra set cod_dfc = '" + cod_dfc + "',can_dfc = '" + can_dfc + "',cod_fc = '" + cod_fc + "',cod_prod = '" + cod_prod + "'  where  detalle_factura_compra cod_dfc = '" + cod_dfc;
              CONEXION.ejecutar(sentencia);
          }


          public DataTable Total()
          {

              sentencia = " select sum (pre_prod * can_dfc) as total from DETALLE_FACTURA_COMPRA inner join FACTURA_COMPRA on DETALLE_FACTURA_COMPRA.cod_dfc = FACTURA_COMPRA.cod_fc inner join producto on detalle_facc.cod_prod = PRODUCTO where FACTURA_COMPRA.cod_fc = " + cod_fc;
              return CONEXION.consultar(sentencia);

          }



        public DataTable consultardetallefacturacompra()
        {
            sentencia = " select cod_dfc as CODIGO,can_dfc as CANTIDAD ,cod_fc as FACTURA_COMPRA,cod_prod as PRODUCTO from detalle_factura_compra ";
            return CONEXION.consultar(sentencia);
        }

        public DataTable consultarcodigodetallefacturacompra()
        {
            sentencia = " select cod_dfc as CODIGO,can_dfc as CANTIDAD ,cod_fc as FACTURA_COMPRA,cod_prod as PRODUCTO from detalle_factura_compra  where cod_dfc = " + cod_dfc;
            return CONEXION.consultar(sentencia);
        }

        public DataTable consultarproducto()
        {
            sentencia = "select prec_prod as precio from producto where cod_prod = " + cod_prod;
            return CONEXION.consultar(sentencia);
        }


        public DataTable consultar_cod_prod()
        {
            sentencia = " select pre_prod as PRECIO from PRODUCTO where nom_prod ='" + nom_prod + "'";
            return CONEXION.consultar(sentencia);
        }


        public DataTable consultar_cod_stock()
        {
            sentencia = " select sto_prod as CANTIDAD from PRODUCTO where nom_prod ='" + nom_prod + "'";
            return CONEXION.consultar(sentencia);
        }


        public void actualizarproductodetalle()
        {                        //nombre de la tabla    campos                                                

            sentencia = " Update producto set nom_prod ='" + nom_prod + "',sto_prod ='" + sto_prod + "'  where nom_prod = " + nom_prod;
            CONEXION.ejecutar(sentencia);


        }

        
    }
}




