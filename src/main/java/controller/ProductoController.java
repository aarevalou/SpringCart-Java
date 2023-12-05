package controller;
import models.Producto;

import spark.Request;
import spark.Response;
import spark.Route;
import static spark.Spark.*;

import java.util.List;

public class ProductoController {

    public static List<Producto> getProductos() {
        return GestorProductos.getProductos();
    }

    public static void initRoutes() {
        // Ruta de ejemplo para obtener la lista de productos
        get("/api/productos", "application/json", new Route() {
            @Override
            public Object handle(Request request, Response response) throws Exception {
                // Obtener la lista de productos
                List<Producto> productos = getProductos();

                // Convertir la lista a JSON usando GestorJson
                String jsonResponse = GestorJson.convertirAJson(productos);

                // Establecer el tipo de contenido de la respuesta
                response.type("application/json");

                // Devolver el JSON
                return jsonResponse;
            }
        });
    }
}
