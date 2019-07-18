using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//agregar 
using System.Data;
using CAPAS_CONEXIONES;

namespace CAPAS_LOGICAS
{
   public class CLASE_UBICACION_STAND
    {
        public int cod_bs { get; set; }
        public int numero_bs {get ;set; }

     public string sentencia;

        //sentencia insertar 
        public void Insertarubicacion()
        {
            //cuando el tipo de dato es caracter es numerico lo unico que le quito es comilla simple (') 
                                                                                                                                                                                  
            sentencia = "insert into ubicacion_stand values (" + numero_bs + ")";
            CONEXION.ejecutar(sentencia);
        }


        //actualizar
        // VOID NO RETORNA DATOS 
        public void actualizarubicacion()
        {                        //nombre de la tabla    campos                                                
            sentencia = " Update ubicacion_stand set numero_bs = '" + numero_bs + "' where cod_bs = " + cod_bs;
            CONEXION.ejecutar(sentencia);               
        }
        //consulta general
        public DataTable consultarubicacion()
        {
            sentencia = "  select  cod_bs  as CODIGO ,numero_bs as NUMERO  from ubicacion_stand ";
            return CONEXION.consultar(sentencia);
        }


        //consulta especifica 
        //SE PONE DATATABLE PARA QUE DE UN DATO
        public DataTable consultarcodigoubicacion()
        {

            sentencia = "  select  cod_bs  as CODIGO, numero_bs as NUMERO from ubicacion_stand where cod_bs  = " + cod_bs;
            return CONEXION.consultar(sentencia);
        }

        public DataTable consultarnombreubicacion()
        {                                    //EL ALIAS
            sentencia = " select numero_bs as NUMERO,cod_bs as CODIGO from ubicacion_stand where numero_bs  = '" + numero_bs + "'";
            return CONEXION.consultar(sentencia);

        }
        public DataTable consultarnumerocontenga()
        {                                    //EL ALIAS
            sentencia = " select numero_bs as NUMERO,cod_bs as CODIGO from ubicacion_stand where numero_bs LIKE '%" + numero_bs + "%'";
            return CONEXION.consultar(sentencia);
        }

        public void eliminarusuario()
        {
            sentencia = "  delete from numero_bs where cod_bs  = " + cod_bs;
            CONEXION.ejecutar(sentencia);

        }
    }
}
