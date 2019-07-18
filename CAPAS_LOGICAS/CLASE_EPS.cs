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
    public class CLASE_EPS
    {
        public int cod_eps { get; set; }
        public string nomb_eps { get; set; }
        public string tel_eps { get; set; }
        public string dir_eps { get; set; }

        public string sentencia;


        //sentencia insertar 
        public void Insertareps()
        {
            try
            {
                //cuando el tipo de dato es caracter, afabetico  y cuando es numerico lo unico que le quito es comilla simple (') 

                sentencia = "insert into eps values ( ' " + nomb_eps + "' , '" + tel_eps + "' , ' " + dir_eps + " ' )";
                CONEXION.ejecutar(sentencia);
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message, "ERROR");
            }
               
        }

        //actualizar 
        // VOID NO RETORNA DATOS 
        public void actualizareps()
        {
            try
            {//nombre de la tabla    campos                                                
                sentencia = " Update eps set nomb_eps = '" + nomb_eps + "' ,tel_eps = '" + tel_eps + "' , dir_eps = '" + dir_eps + "'  where cod_eps= " + cod_eps;
                CONEXION.ejecutar(sentencia);
            }

            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message, "ERROR");
            }
                         
              
        }
        //consulta general
        public DataTable consultareps()
        {

            sentencia = "  select  cod_eps as CODIGO ,nomb_eps as NOMBRE, tel_eps as TELEFONO , dir_eps as DIRECCION from eps  ";
            return CONEXION.consultar(sentencia);

        }


        //consulta especifica 
        //SE PONE DATATABLE PARA QUE DE UN DATO
        public DataTable consultarcodigoeps()
        {

            sentencia = "  select  cod_eps as CODIGO,nomb_eps as NOMBRE ,tel_eps as TELEFONO,dir_eps as DIRECCION  from eps where cod_eps = " + cod_eps;
            return CONEXION.consultar(sentencia);
        }

        public DataTable consultarnombreeps()
        {
            sentencia = " select nomb_eps as NOMBRE,cod_eps as CODIGO , tel_eps as TELEFONO, dir_eps as DIRECCION from eps where nomb_eps = '" + nomb_eps + "'";
            return CONEXION.consultar(sentencia);
        }
        public DataTable consultarnombrecontenga()
        {
            sentencia = " select nomb_eps as NOMBRE,cod_eps as CODIGO , tel_eps as TELEFONO, dir_eps as DIRECCION from eps where nomb_eps LIKE '%" + nomb_eps + "%'";
            return CONEXION.consultar(sentencia);
        }



    
   




    }
}
