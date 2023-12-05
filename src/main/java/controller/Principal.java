package controller;

import view.IConsola;

import static spark.Spark.port;

public class Principal {
    public static void main(String[] args) {
        GestorMySQL.ActualizarConexion();

        // Verificar si la base de datos ya existe
        if (!GestorMySQL.existeBaseDatos()) {
            // Si no existe, crear la base de datos
            GestorMySQL.crearBaseDatos();
            System.out.println("BASE DE DATOS CREADA");
        } else {
            System.out.println("BASE DE DATOS YA EXISTE");
        }

        // Ejecutar el scriptSQL solo si la base de datos no existía previamente
        if (!GestorMySQL.existeBaseDatos()) {
            GestorMySQL.precargarSQL("scriptSQL.sql");
            System.out.println("BASE DE DATOS ACTUALIZADA");
        }

        // Resto de tu código...
        GestorProductos.actualizarDatos();
        port(8080);
        ProductoController.initRoutes();
        IConsola.mostrarMenuLogin();
    }
}
