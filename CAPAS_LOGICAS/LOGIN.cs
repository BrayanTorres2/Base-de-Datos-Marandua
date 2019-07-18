using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using CAPAS_CONEXIONES;


namespace CAPAS_LOGICAS
{
    public class LOGIN : CONEXION
    {
        public int cod_us { get; set; }
        public string nombre { get; set; }
        public string contraseñas { get; set; }
        public int cod_emp;
        public int cod_car;
        public string sentencia;
        private string usuario;
        public string contraseña;



        public DataTable consultarlogin()
        {
            string sentencia;
            sentencia = "select cod_us as codigo ,nombre as nombre ,contraseña as contraseña ,nom_emp from empleado  inner join on empleado.codigoempleado=login.codigoempleado,nom_car from cargo  inner join on cargo.codigocargo=login.codigocargo";
            return CONEXION.consultar(sentencia);
             //--select * from TABLA1 inner join TABLA2 on TABLA1.COD_TABLA = TABLA2.COD_TABLA; --

        }

        public void insertarlogin()
        {
            sentencia = "Exec sp_insertar_login'" + nombre + "','" + contraseñas + "'," + cod_emp + "," + cod_car + " ";
            CONEXION.ejecutar(sentencia);

        }

        public DataTable ConsultarUsuario()
        {
            sentencia = "select * from login";
            return CONEXION.consultar(sentencia);
        }
        public LOGIN()
        {
            usuario = string.Empty;
            contraseña = string.Empty;
            this.sql = string.Empty;
        }
        public string Usuario
        {
            get { return this.usuario; }
            set { this.usuario = value; }

        }


        public string Contraseña
        {
            get { return this.contraseña; }
            set { this.contraseña = value; }

        }

        public bool buscar()
        {
            bool resultado = false;
            this.sql = string.Format(@"select cod_us from login where nombre='{0}' and contraseña='{1}'" , this.usuario, this.contraseña); 
            this.comandosql = new SqlCommand(this.sql, this.cnn);
           
            this.cnn.Open();
            SqlDataReader re = null;
            re = this.comandosql.ExecuteReader();

            if (re.Read())
            {
                resultado = true;
                this.mensaje = "Datos Correctos";

            }
            else
            {
                this.mensaje = "Datos Erroneos ";

            }
            this.cnn.Close();
            return resultado;
        }
    }
}


  

        
    

