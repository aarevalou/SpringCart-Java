import controller.ProductoController;
import controller.UsuarioController;
import services.GestorMySQL;
import services.GestorProductos;
import services.GestorUsuarios;

import static spark.Spark.port;

public class Principal {
    public static void main(String[] args) {
        GestorMySQL.ActualizarConexion();

        if (!GestorMySQL.verificarExistencia()) {
            GestorMySQL.precargarSQL("scriptSQL.sql");
        }

        GestorProductos.actualizarDatos();
        GestorUsuarios.actualizarDatos();
        port(8080);
        ProductoController.initRoutes();
        UsuarioController.initRoutes();
    }
}
