using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
// 1 LIBRERIA 
using System.Data.SqlClient;//establecer una relacion con sql
using System.Data;


namespace CAPAS_CONEXIONES
{
    //SE DEBEN CONVERTIR LAS CLASES EN PUBLICAS
    public class CONEXION
    {
        //DECLARAR VARIABLES
        //public static significa  que no cambia
        public string cadenaconexion ;
        public static SqlConnection cadena;
        public static SqlCommand comando;  // permite insertar y actualizar

        public static SqlDataReader lecturaDatos; //lectura de datos 
        public static DataTable tabla;  //mostrar esos datos 

        //private 
      public static void conectar() // conectar con sql server mediante un metodo y es privado 
        {

            // @"Data Source= EL ORIGEN DE LOS DATOS //  //el error era la digitacion deintegrated  //.\SQLEXPRESS o(Local)nombre del servidor de sql server // Initial Catalog=ejemplo, NOMBRE DE LA BASE DE DATO QUE QUEREMOS  CONETAR , // integated security=TruePARA QUE MANTEGA TODA LA SEGURIDAD
            cadena = new SqlConnection(@"Data Source=(Local);Initial Catalog=MARANDUA;integrated security=True");//metodo permite conectar con sql server y lo pùedo invocar en cualquier parte del programa
          

            comando = new SqlCommand();
            comando.Connection = cadena;     //CONECTAR EL COMANDO     
        }
        public static void ejecutar(string sentencia)
        {
            // EJECUTAR
            conectar();
            comando.CommandText = sentencia;
            cadena.Open();
            comando.ExecuteNonQuery();
            cadena.Close();

        }

        //METODO DE  CONSULTAR ,RETONA A UNA TABLA 

        public static DataTable consultar(string sentencia)
        {


            conectar();//covocamos el metodo canectar 
            comando.CommandText = sentencia;// ejecutar la sencia que va a generAR 
            cadena.Open();
            lecturaDatos = comando.ExecuteReader();
            tabla = new DataTable(); // GUARDAR EN LA TABLA 
            tabla.Load(lecturaDatos);
            lecturaDatos.Close();//salir
            cadena.Close(); // salir 
            return tabla; // RETORNAR A LA TABLA DE LA INFORMAcion que esta copnslutada  

        }

        protected string sql;
         protected SqlConnection cnn;
         protected SqlCommand comandosql;
         protected string mensaje;

        public CONEXION()
        {
            this.cadenaconexion = (@"Data Source=(Local);Initial Catalog=MARANDUA;integrated security=True");
            this.cnn = new SqlConnection(this.cadenaconexion);
        }
        
                }
            }
        
    

         

    


