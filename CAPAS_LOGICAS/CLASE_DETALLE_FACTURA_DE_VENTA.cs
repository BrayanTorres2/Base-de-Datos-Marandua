using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using CAPAS_CONEXIONES;

namespace CAPAS_LOGICAS
{
    public class CLASE_DETALLE_FACTURA_DE_VENTA
    {
        public int cod_dfv { get; set; }
        public int can_dfv { get; set; }
        public int cod_prod { get; set; }
        public string nom_prod { get; set; }
        public int cod_fv { get; set; }
        public int tt_fv;

       
        public string sentencia;




        public void Insertar_DETALLE_FACTURA_DE_VENTA()
        {
            sentencia = " insert into DETALLE_FACTURA_DE_VENTA values (" + cod_dfv + ", " + can_dfv + ", " + cod_prod + ", " + cod_fv + ")";
            CONEXION.ejecutar(sentencia);

        }

        public void Actualizar_DETALLE_FACTURA_DE_VENTA()
        {
            sentencia = " update DETALLE_FACTURA_DE_VENTA set can_dfv = " + can_dfv + ", cod_prod = " + cod_prod + ",cod_fv=" + cod_fv +  " where cod_dfv=" + cod_dfv;

        }

        public DataTable Total()
        {

            sentencia = " select sum (pre_prod * can_dfv) as total from DETALLE_FACTURA_DE_VENTA inner join FACTURA_DE_VENTA on DETALLE_FACTURA_DE_VENTA.cod_dfv = FACTURA_DE_VENTA.cod_fv inner join producto on detalle_facv.cod_prod = PRODUCTO where FACTURA_DE_VENTA.cod_fv = " + cod_fv;
            return CONEXION.consultar(sentencia);

        }

        public DataTable Consultar_DETALLE_FACTURA_DE_VENTA()
        {
            sentencia = " select cod_dfv as CODIGO,can_dfv as CONTIDAD,cod_prod as PRODUCTO,cod_fv as CODIGO_Venta     from DETALLE_FACTURA_DE_VENTA ";
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


        public void insertardetallefacturaventa()
        {
            throw new NotImplementedException();
        }
    }
}
