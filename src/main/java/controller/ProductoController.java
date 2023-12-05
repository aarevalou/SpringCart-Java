package controller;

import models.Producto;
import services.GestorJson;
import services.GestorMySQL;
import services.GestorObjeto;
import services.GestorProductos;
import spark.Response;
import static spark.Spark.*;

import java.util.Collections;
import java.util.List;

public class ProductoController {

    public static void initRoutes() {
        get("/api/productos", "application/json", (request, response) ->
                verificarExistencia(GestorProductos.getProductos(), response));


        get("/api/productos/:id", "application/json", (request, response) -> {
            int productoId = Integer.parseInt(request.params(":id"));
            return verificarExistencia(Collections.singletonList(GestorProductos.obtenerProductoPorID(productoId)), response);
        });

        get("/api/productos/categoria/:id", "application/json", (request, response) -> {
            try {
                int categoriaID = Integer.parseInt(request.params(":id"));
                List<Producto> productos = GestorProductos.obtenerProductosPorCategoria(categoriaID);
                return verificarExistencia(productos, response);
            } catch (Exception e) {
                return e;
            }
        });

        get("/api/productos/marca/:id", "application/json", (request, response) -> {
            try {
                int marcaID = Integer.parseInt(request.params(":id"));
                List<Producto> productos = GestorProductos.obtenerProductosPorMarca(marcaID);
                return verificarExistencia(productos, response);
            } catch (Exception e) {
                return e;
            }
        });

        get("/api/productos-asc", "application/json", (request, response) ->
                verificarExistencia(GestorProductos.obtenerProductosPorPrecioAsc(), response));

        get("/api/productos-desc", "application/json", (request, response) ->
                verificarExistencia(GestorProductos.obtenerProductosPorPrecioDesc(), response));

        get("/api/categorias", "application/json", (request, response) -> {
            List<String> categorias = GestorProductos.getCategorias();
            String jsonResponse = GestorJson.convertirAJson(categorias);
            response.type("application/json");
            return jsonResponse;
        });

        get("/api/marcas", "application/json", (request, response) -> {
            List<String> marcas = GestorProductos.getMarcas();
            String jsonResponse = GestorJson.convertirAJson(marcas);
            response.type("application/json");
            return jsonResponse;
        });

        post("/api/productos", "application/json", (request, response) -> {
            try {
                Producto nuevoProducto = GestorJson.convertirDesdeJson(request.body(), Producto.class);
                GestorProductos.agregarProducto(nuevoProducto);
                GestorMySQL.insertarRegistro("Producto", GestorObjeto.obtenerAtributosObjeto(nuevoProducto));
                return "Producto registrado exitosamente";
            } catch (Exception e) {
                return e;
            }
        });

        delete("/api/productos/:id", "application/json", (request, response) -> {
            try {
                int productoId = Integer.parseInt(request.params(":id"));
                GestorProductos.eliminarProductoPorId(productoId);
                GestorMySQL.eliminarRegistro("producto", "id", String.valueOf(productoId));
                return "Producto eliminado exitosamente";
            } catch (Exception e) {
                return e;
            }
        });

        put("/api/productos/:id", "application/json", (request, response) -> {
            try {
                int productoId = Integer.parseInt(request.params(":id"));

                Producto productoExistente = GestorProductos.obtenerProductoPorID(productoId);

                if (productoExistente != null) {
                    Producto productoActualizado = GestorJson.convertirDesdeJson(request.body(), Producto.class);

                    productoExistente.setMarca_id(productoActualizado.getMarca_id());
                    productoExistente.setDetalle(productoActualizado.getDetalle());
                    productoExistente.setPrecio(productoActualizado.getPrecio());
                    productoExistente.setStock(productoActualizado.getStock());
                    productoExistente.setCategoria_id(productoActualizado.getCategoria_id());

                    GestorMySQL.modificarRegistro("producto", GestorObjeto.obtenerAtributosObjeto(productoActualizado));

                    return "Producto actualizado exitosamente";
                } else {
                    return "Producto no encontrado";
                }
            } catch (Exception e) {
                return e;
            }
        });
    }

    private static String verificarExistencia(List<Producto> productos, Response response) {
        if (!productos.isEmpty()) {
            String jsonResponse = GestorJson.convertirAJson(productos);
            response.type("application/json");
            return jsonResponse;
        } else {
            response.status(404);
            return "Producto no encontrado";
        }
    }
}
