using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//agregar 
using System.Data;
using System.Windows.Forms;
using System.Data.SqlClient;
using CAPAS_CONEXIONES;

namespace CAPAS_LOGICAS
{
    //la clase se pone en public
     public class CLASE_EMPLEADO
    {
        public int cod_emp { get; set; }
        public Int32 id_emp { get; set; }
        public string tid_emp { get; set; }
        public string nom_emp { get; set; }
        public string ape_emp { get; set; }
        public string tel_emp { get; set; }
        public string cel_emp { get; set; } 
        public string dir_emp { get; set; }
        //LLAVE FK CARGO
        public int cod_car { get; set; } 
         //LAVE FK EPS
        public int cod_eps { get; set; }
      
   
        public string sentencia;

        //sentencia insertar 
        public void Insertarempleado()
        {
           
                //cuando el tipo de dato es caracter es numerico lo unico que le quito es comilla simple (') 
                //llave fk
                sentencia = "insert into empleado values (" + id_emp + " , '" + tid_emp + "' , '" + nom_emp + "' ,' " + ape_emp + "', '" + tel_emp + "' , '" + cel_emp + "' ,'" + dir_emp + "', " + cod_car + ","+cod_eps+")";
                CONEXION.ejecutar(sentencia);
            }
           
        //actualizar
        // VOID NO RETORNA DATOS 
        public void actualizarempleado()
        {                        //nombre de la tabla    campos                                                
            //try
            //{
                sentencia = " Update empleado set id_emp = '" + id_emp + "',tid_emp = '" + tid_emp + "', nom_emp = '" + nom_emp + "' ,ape_emp = '" + ape_emp + "',tel_emp= '" + tel_emp + "' ,cel_emp= '" + cel_emp + "' ,dir_emp= '" + dir_emp + "', cod_car = '" + cod_car + "',cod_eps='" + cod_eps + "' where  cod_emp = " + cod_emp;
                CONEXION.ejecutar(sentencia);

            //}
            //catch (SqlException ex)
            //{
            //    MessageBox.Show(ex.Message, "ERROR");
            //}
        
        }
        //consulta general
        public DataTable consultarempleado()
        {

            sentencia = "  select  cod_emp  as CODIGO ,id_emp as IDENTIFICACION ,tid_emp as TID,nom_emp  as NOMBRE,ape_emp as APELLIDO,tel_emp as TELEFONO, cel_emp as CELULAR ,dir_emp  as DIRECCION, cod_car as CARGO,cod_eps as EPS from empleado ";
                return CONEXION.consultar(sentencia);
        }
           
        //consulta especifica 
        //SE PONE DATATABLE PARA QUE DE UN DATO
        public DataTable consultarcodigoempleado()
        {

            sentencia = "  select  cod_emp  as CODIGO, id_emp as IDENTIFICACION,tid_emp as TID, nom_emp as NOMBRE,ape_emp as APELLIDO,tel_emp as TELEFONO,cel_emp as CELULAR ,dir_emp as DIRECCION ,cod_car as CARGO,cod_eps as EPS from empleado where cod_emp  = " + cod_emp;
            return CONEXION.consultar(sentencia);
        }

        public DataTable consultarnombreempleado()
        {                                    //EL ALIAS
            sentencia = " select id_emp as IDENTIFICACION,cod_emp as CODIGO, nom_emp as NOMBRE,tid_emp as TID, tel_emp as TELEFONO,cel_emp as CELULAR ,dir_emp as DIRECCION,cod_car as CARGO,cod_eps as EPS from empleado where id_emp  = '" + id_emp + "'";
            return CONEXION.consultar(sentencia);
        }
        //public DataTable consultarnombreinicial()
        //{
        //    sentencia = " select nom_emp as NOMBRE,cod_emp as CODIGO, id_emp as IDENTIFICACION,tid_emp as TID, tel_emp as TELEFONO,cel_emp as CELULAR ,dir_emp as DIRECCION,cod_car as CARGO,cod_eps as EPS from empleado where nom_emp LIKE '" + nom_emp + "%'";
        //    return CONEXION.consultar(sentencia);
        //}
        public DataTable consultarnombrecontenga()
        {
            sentencia = " select id_emp as IDENTIFICACION,cod_emp as CODIGO, nom_emp as NOMBRE,tid_emp as TID, tel_emp as TELEFONO,cel_emp as CELULAR ,dir_emp as DIRECCION,cod_car as CARGO,cod_eps as EPS from empleado where id_emp LIKE '" + id_emp + "%'";
            return CONEXION.consultar(sentencia);
        }
             
        public void eliminarusuario()
        {
            sentencia = "  delete from empleado where cod_emp  = " + cod_emp;
            CONEXION.ejecutar(sentencia);

        }

    }
}
