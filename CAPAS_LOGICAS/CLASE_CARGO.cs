using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
// LIBRERIA AGREGAR
using System.Windows.Forms;
using System.Data;
using System.Drawing.Imaging;
using System.Data.SqlClient;
using System.IO;

using CAPAS_CONEXIONES;


namespace CAPAS_LOGICAS
{
  //SE DEBEN CONVERTIR LAS CLASES EN PUBLICAS
   public class CLASE_CARGO
    {
        public int cod_car { get; set; }
        public string nom_car { get; set; }
        public string sentencia;


        //sentencia insertar 
        public void Insertarcargo()
        {
            
                //cuando el tipo de dato es caracter, afabetico  y cuando es numerico lo unico que le quito es comilla simple (') 
                sentencia = "insert into cargo values ('" + nom_car + "')";          
                CONEXION.ejecutar(sentencia);

            
        }
        

         //actualizar cargo
       // VOID NO RETORNA DATOS 
        public void actualizarcargo()
        {
            //if (nom_car == nom_car)
            //{
            //    MessageBox.Show("POR FAVOR MODIFIQUE EL REGISTRO", "DATO A MODIFICADO", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            //}
            //try
            //{//nombre de la tabla    campos 
            //else if (nom_car==nom_car)
            //{
            sentencia = " Update cargo set nom_car = '" + nom_car + "' where cod_car = " + cod_car;
            CONEXION.ejecutar(sentencia);
            //}
               
            
        //catch (SqlException )
        //{
        //   MessageBox.Show("POR FAVOR MODIFIQUE EL REGISTRO", "DATO A MODIFICADO", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        //}
        }
   
       //consulta general
        public DataTable consultarcargo()
        {
            
            sentencia = "  select  cod_car as CODIGO ,nom_car as NOMBRE from cargo ";
            return CONEXION.consultar(sentencia);
        }
     
       //consulta especifica 
       //SE PONE DATATABLE PARA QUE DE UN DATO
        public DataTable consultarcodigocargo()
        {

            sentencia = "  select  cod_car as CODIGO,nom_car as NOMBRE from cargo where cod_car = " +cod_car;
            return CONEXION.consultar(sentencia);
        }

       public DataTable consultarnombrecargo()
       {
           sentencia = " select nom_car as NOMBRE,cod_car as CODIGO from cargo where nom_car = '" + nom_car+ "'";

           return CONEXION.consultar(sentencia);
       }
      
       public DataTable consultarnombrecontenga()
       {
           sentencia = " select nom_car as NOMBRE,cod_car as CODIGO from cargo where nom_car LIKE '%" + nom_car + "%'"; 
           return CONEXION.consultar(sentencia);
        
       }

       public void eliminarusuario()

       {
           sentencia = "  delete from cargo where cod_car = " +cod_car ;
           CONEXION.ejecutar(sentencia);     

       }

  
    }
}
