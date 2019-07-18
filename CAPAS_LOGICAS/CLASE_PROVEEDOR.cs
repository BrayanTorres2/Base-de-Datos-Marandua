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
    //pasar la clase a publica
     public class CLASE_PROVEEDOR
    {
        public int cod_prov { get; set; }
        public string nom_prov { get; set; }
        public string tel_prov { get; set; }
        public string dir_prov { get; set; }

        public string sentencia;

        //sentencia insertar 
        public void Insertarproveedor()
        {
            try
            {
                //cuando el tipo de dato es caracter, afabetico  y cuando es numerico lo unico que le quito es comilla simple (') 

                sentencia = "insert into proveedor values (" + cod_prov + ",'" + nom_prov + "', '" + tel_prov + "', '" + dir_prov + "')";
                CONEXION.ejecutar(sentencia);

            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message, "Error");
            }

        }

        //actualizar
        // VOID NO RETORNA DATOS 
        public void actualizarproveedor()
        {
            try
            {                     //nombre de la tabla    campos                                                
                // sentencia = " Update proveedor set cod_prov = " +cod_prov+ ", '"+nom_prov+ "'," +tel_prov+ ",'" +dir_prov+  "'where cod_prov= " + cod_prov;
                sentencia = " Update proveedor set nom_prov = '" + nom_prov + "', tel_prov ='" + tel_prov + "' , dir_prov = '" + dir_prov + "' where cod_prov = " + cod_prov;
                CONEXION.ejecutar(sentencia);
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message, "Error");
            }
                

        }
        //consulta general
        public DataTable consultarproveedor()
        {

            sentencia = "  select  cod_prov  as CODIGO ,nom_prov  as NOMBRE,tel_prov as TELEFONO,dir_prov as DIRECCION from proveedor ";
            return CONEXION.consultar(sentencia);

        }


        //consulta especifica 
        //SE PONE DATATABLE PARA QUE DE UN DATO
        public DataTable consultarcodigoproveedor()
        {

            sentencia = "  select  cod_prov  as CODIGO,nom_prov as NOMBRE,tel_prov as TELEFONO,dir_prov as DIRECCION from proveedor where cod_prov  = " + cod_prov;
            return CONEXION.consultar(sentencia);
        }

        public DataTable consultarnombreproveedor()
        {                                    //EL ALIAS
           sentencia = " select nom_prov as NOMBRE,cod_prov as CODIGO,tel_prov as TELEFONO,dir_prov as DIRECCION from proveedor  where nom_prov  = '" + nom_prov + "'";
           return CONEXION.consultar(sentencia);

        }
        public DataTable consultarcontengaproveedor()
        {
            sentencia = " select nom_prov as NOMBRE,cod_prov as CODIGO,tel_prov as TELEFONO,dir_prov as DIRECCION from proveedor  where nom_prov  = '%" + nom_prov + "%'";
            return CONEXION.consultar(sentencia);
        }

             


        public void eliminarusuario()
        {
            sentencia = "  delete from proveedor where cod_prov  = " + cod_prov;
            CONEXION.ejecutar(sentencia);

        }

      

    }
}
