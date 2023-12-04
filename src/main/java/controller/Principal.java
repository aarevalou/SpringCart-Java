package controller;
import view.IConsola;

public class Principal {
    public static void main(String[] args) {
        GestorMySQL.ActualizarConexion();
        GestorProductos.actualizarDatos();
        IConsola.mostrarMenuLogin();
    }
}