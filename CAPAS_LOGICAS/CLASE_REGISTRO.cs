using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using CAPAS_CONEXIONES;

namespace CAPAS_LOGICAS
{
    public class CLASE_REGISTRO
    {
        public int cod_us { get; set; }
        public string nombre { get; set; }
        public string contraseña { get; set; }
        public int cod_emp { get; set; }

        public string sentencia;

                public void Insertarregistro()

        {
            //cuando el tipo de dato es caracter es numerico lo unico que le quito es comilla simple (') 
            //llave fk
            sentencia = "insert into Login values ('" + nombre + "' , '" + contraseña + "' , '" + cod_emp + "')";
            CONEXION.ejecutar(sentencia);
        }


        //actualizar
        // VOID NO RETORNA DATOS 
        public void actualizarregistro()
        {                        //nombre de la tabla    campos                                                
            sentencia = " Update Login set  CONTRASEÑA = '" + contraseña + "' ,cod_emp= '" + cod_emp + "' where NOMBRE = '" + nombre + "'";
            CONEXION.ejecutar(sentencia);
        }
        //consulta general
        public DataTable consultarregistro()
        {

            sentencia = "  select  login.cod_us  as CODIGO , login.nombre as NOMBRE , login.contraseña as CONTRASEÑA,empleado.cod_emp as CODIGO_EMPLEADO  from Login  inner join empleado on login.cod_emp=TID where empleado.cod_emp=" + cod_emp;
            return CONEXION.consultar(sentencia);
           

            //"select cod_us as codigo ,nombre as nombre ,contraseña as contraseña ,nom_emp from empleado  inner join on empleado.codigoempleado=login.codigoempleado,nom_car from cargo  inner join on cargo.codigocargo=login.codigocargo";


            //sentencia = " select cod_usuario as CODIGO, NOMBRE AS NOMBRE, CONTRASEÑA AS CONTRASEÑA, NOM_EMPLEADO AS EMPLEADO FROM  EMPLEADO INNER JOIN  LOGIN ON EMPLEADO.Cod_Empleado = LOGIN.Cod_Empleado";
            //return CBD_DROGUERIA.Consultar(sentencia);


            //string sentencia;
            //sentencia = "SELECT EMPLEADO.NOM_EMP, TIPO_EMPLEADO.NOM_TIPEMP FROM  EMPLEADO INNER JOIN TIPO_EMPLEADO ON EMPLEADO.COD_TIPEMP = TIPO_EMPLEADO.COD_TIPEMP WHERE TIPO_EMPLEADO.NOM_TIPEMP='ADMINISTRADOR'";
            //return CLASE_CONEX.Consultar(sentencia);

            //sentencia = "  select  login.cod_us  as CODIGO , login.nombre as NOMBRE , login.contraseña as CONTRASEÑA,empleado.nom_emp,empleado.ape.emp from Login  inner join empleado on login.cod_emp=cod_emp";
          

            //sentencia="select cod_us,nombre,contraseña,empleado.nom_emp,empleado.ape_emp login inner join empleado on login.cod_emp = empleado.cod_emp";
            
            //--select * from TABLA1 inner join TABLA2 on TABLA1.COD_TABLA = TABLA2.COD_TABLA; --
            //sentencia = "SELECT PRODUCTO.Cod_Producto AS CODIGO,PRODUCTO.Nom_Producto AS NOMBRE, PRODUCTO.Des_Producto AS DESCRIPCION, PRODUCTO.Pre_Producto AS 'PRECIO/VALOR',producto.Fevencimiento as VENCIMIENTO,  CATEGORIA.Des_Categoria AS CATEGORIA, LABORATORIO.Nom_Laboratorio AS LABORATORIO,UBICACION.Numero_Estan AS 'NUMERO ESTAN' , estado_producto as ESTADO FROM PRODUCTO INNER JOIN CATEGORIA ON PRODUCTO.Cod_Categoria = CATEGORIA.Cod_Categoria INNER JOIN LABORATORIO ON PRODUCTO.Cod_Laboratorio = LABORATORIO.Cod_Laboratorio INNER JOIN UBICACION ON CATEGORIA.Cod_Ubicacion = UBICACION.Cod_Ubicacion ";
            //return CBD_DROGUERIA.Consultar(sentencia);
        }


        //consulta especifica 
        //SE PONE DATATABLE PARA QUE DE UN DATO
        public DataTable consultarcodigoregistro()
        {

            sentencia = "  select  cod_us  as CODIGO, nombre as NOMBRE, contraseña as CONTRASEÑA ,cod_emp as CODIGO_EMPLEADO from Login where cod_us  = " + cod_us;
            return CONEXION.consultar(sentencia);
        }

        public DataTable consultarnombre()
        {                                    //EL ALIAS
            sentencia = " select nombre as NOMBRE,cod_us as CODIGO, contraseña as CONTRASEÑA, cod_emp as CODIGO_EMPLEADO from Login where nombre  = '" + nombre + "'";
            return CONEXION.consultar(sentencia);

        }

        public DataTable consultarnombrecontenga()
        {
            sentencia = " select nombre as NOMBRE,cod_us as CODIGO, contraseña as CONTRASEÑA, cod_emp as CODIGO_EMPLEADO from Login where nombre  = '%" + nombre + "%'";
            return CONEXION.consultar(sentencia);

        }

        public void eliminarregistro()
        {
            sentencia = "  delete from Login where cod_us  = " + cod_us;
            CONEXION.ejecutar(sentencia);

        }

    }
}



