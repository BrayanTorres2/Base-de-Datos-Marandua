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
   public class CLASE_CATEGORIA
    {
       public int cod_cat { get; set; }
       public string nomb_cat { get; set; }
       //LLAVE FK ubicacion stand
        public int cod_bs { get; set; }


 
        public string sentencia;

        //sentencia insertar 
        public void Insertarcategoria()

         {
            
          
            //cuando el tipo de dato es caracter es numerico lo unico que le quito es comilla simple (')
                                                                                                 //llave fk
                 sentencia = "insert into categoria values ('" + nomb_cat + " ', " + cod_bs + ")";
            CONEXION.ejecutar(sentencia);
            
        }


        //actualizar
        // VOID NO RETORNA DATOS 
        public void actualizarcategoria()
        {                        //nombre de la tabla    campos                                                

            try
            {
                sentencia = " Update categoria set nomb_cat = '" + nomb_cat + "' ,cod_bs = '" + cod_bs + "' where cod_cat = " + cod_cat;
                CONEXION.ejecutar(sentencia);
            }

            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message, "Error");
            }
        
           

        }
        //consulta general
        public DataTable consultarcategoria()
        {


            sentencia = "  select  cod_cat  as CODIGO ,nomb_cat as NOMBRE ,cod_bs  as UBICACION from categoria ";
            return CONEXION.consultar(sentencia);
        }
 


        //consulta especifica 
        //SE PONE DATATABLE PARA QUE DE UN DATO
        public DataTable consultarcodigocategoria()
        {

            sentencia = "  select  cod_cat  as CODIGO, nomb_cat as NOMBRE from categoria where cod_cat  = " + cod_cat;
            return CONEXION.consultar(sentencia);
        }

        public DataTable consultarnombrecategoria()
        {                                    //EL ALIAS
            sentencia = " select nomb_cat as NOMBRE,cod_cat as CODIGO  from categoria where nomb_cat  = '" + nomb_cat + "'";
            return CONEXION.consultar(sentencia);

        }
        public DataTable consultarnombrecontenga()
        {
            sentencia = " select nomb_cat as NOMBRE,cod_cat as CODIGO from categoria where nomb_cat LIKE '%" + nomb_cat + "%'";
            return CONEXION.consultar(sentencia); 
        }


        public void eliminarusuario()
        {
            sentencia = "  delete from categoria where cod_cat  = " + cod_cat;
            CONEXION.ejecutar(sentencia);

        }
    }
}
