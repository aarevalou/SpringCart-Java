package controller;

import models.Admin;
import models.Cliente;
import models.Usuario;
import services.GestorJson;
import services.GestorMySQL;
import services.GestorObjeto;
import services.GestorUsuarios;
import spark.Response;
import java.util.Collections;
import java.util.List;

import static spark.Spark.*;

public abstract class UsuarioController {

    public static void initRoutes() {
        get("/api/usuarios", "application/json", (request, response) -> {
            List<Usuario> usuarios = GestorUsuarios.getUsuarios();
            return verificarExistencia(usuarios, response);
        });

        get("/api/clientes/:id", "application/json", (request, response) -> {
            int id = Integer.parseInt(request.params(":id"));
            return verificarExistencia(Collections.singletonList(GestorUsuarios.obtenerClientePorId(id)), response);

        });

        get("/api/admins/:id", "application/json", (request, response) -> {
            int id = Integer.parseInt(request.params(":id"));
            return verificarExistencia(Collections.singletonList(GestorUsuarios.obtenerAdminPorId(id)), response);

        });

        delete("/api/clientes/:id", "application/json", (request, response) -> {
            try {
                int clienteId = Integer.parseInt(request.params(":id"));
                GestorUsuarios.eliminarClientePorId(clienteId);
                GestorMySQL.eliminarRegistro("Cliente", "id", String.valueOf(clienteId));
                return "Cliente eliminado exitosamente";
            } catch (Exception e) {
                return e;
            }
        });

        delete("/api/admins/:id", "application/json", (request, response) -> {
            try {
                int adminId = Integer.parseInt(request.params(":id"));
                GestorUsuarios.eliminarAdminPorId(adminId);
                GestorMySQL.eliminarRegistro("Admin", "id", String.valueOf(adminId));
                return "Admin eliminado exitosamente";
            } catch (Exception e) {
                return e;
            }
        });

        post("/api/clientes", "application/json", (request, response) -> {
            try {
                Cliente nuevoCliente = GestorJson.convertirDesdeJson(request.body(), Cliente.class);
                GestorUsuarios.agregarCliente(nuevoCliente);
                GestorMySQL.insertarRegistro("cliente", GestorObjeto.obtenerAtributosObjeto(nuevoCliente));
                return "Cliente registrado exitosamente";
            } catch (Exception e) {
                return e;
            }
        });

        post("/api/admins", "application/json", (request, response) -> {
            try {
                Admin nuevoAdmin = GestorJson.convertirDesdeJson(request.body(), Admin.class);
                GestorUsuarios.agregarAdmin(nuevoAdmin);
                return "Admin registrado exitosamente";
            } catch (Exception e) {
                return e;
            }
        });

    }

    private static String verificarExistencia(List<Usuario> usuarios, Response response) {
        if (!usuarios.isEmpty()) {
            String jsonResponse = GestorJson.convertirAJson(usuarios);
            response.type("application/json");
            return jsonResponse;
        } else {
            response.status(404);
            return "Usuario no encontrado";
        }
    }
}
