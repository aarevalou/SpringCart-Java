package services;

import models.Admin;
import models.Cliente;
import models.Usuario;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

public abstract class GestorUsuarios {

    public static ArrayList<Usuario> usuarios;

    private static void obtenerUsuarios() {

        usuarios = new ArrayList<>();
        for (int i = 0; i < GestorMySQL.obtenerCantidadRegistros("Cliente"); i++) {
            HashMap<String, String> registros = GestorMySQL.obtenerRegistro("Cliente", "id", String.valueOf(i + 1));
            Cliente cliente = new Cliente();
            cliente.setId(Integer.parseInt(registros.get("id")));
            cliente.setRut(registros.get("rut"));
            cliente.setNombre(registros.get("nombre"));
            cliente.setEmail(registros.get("email"));
            cliente.setPassword(registros.get("password"));
            cliente.setDireccion(registros.get("direccion"));
            cliente.setSaldo(Integer.parseInt(registros.get("saldo")));
            usuarios.add(cliente);
        }

        for (int i = 0; i < GestorMySQL.obtenerCantidadRegistros("Admin"); i++) {
            HashMap<String, String> registros = GestorMySQL.obtenerRegistro("Admin", "id", String.valueOf(i + 1));
            Admin admin = new Admin();
            admin.setId(Integer.parseInt(registros.get("id")));
            admin.setRut(registros.get("rut"));
            admin.setNombre(registros.get("nombre"));
            admin.setEmail(registros.get("email"));
            admin.setPassword(registros.get("password"));
            admin.setDireccion(registros.get("direccion"));
            admin.setFecha_ingreso(registros.get("fecha_ingreso"));
            admin.setSalario(registros.get("salario"));
            admin.setCargo(registros.get("cargo"));
            usuarios.add(admin);
        }
    }

    public static String obtenerFechaActual(){
        LocalDate fechaActual = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return fechaActual.format(formatter);
    }

    public static Usuario iniciarSesion(String email, String password) {
        HashMap<String, String> atributosUsuario = GestorMySQL.obtenerRegistro("Cliente", "email,password", email + "," + password);
        if (!atributosUsuario.isEmpty()) {
            return (Cliente) GestorObjeto.construirObjeto(new Cliente(), atributosUsuario);
        }
        atributosUsuario = GestorMySQL.obtenerRegistro("Admin", "email,password", email + "," + password);
        if (!atributosUsuario.isEmpty()) {
            return (Admin) GestorObjeto.construirObjeto(new Admin(), atributosUsuario);
        }
        return null;
    }

    public static ArrayList<Usuario> getUsuarios() {
        return usuarios;
    }

    public static void actualizarDatos() {
        obtenerUsuarios();
    }

    public static List<Usuario> obtenerClientes() {
        return usuarios.stream()
                .filter(usuario -> usuario.getClass().getSimpleName().equals("Cliente"))
                .collect(Collectors.toList());
    }

    public static List<Usuario> obtenerAdmins() {
        return usuarios.stream()
                .filter(usuario -> usuario.getClass().getSimpleName().equals("Administrador"))
                .collect(Collectors.toList());
    }

    public static Cliente obtenerClientePorId(int id) {
        return (Cliente) usuarios.stream()
                .filter(usuario -> usuario.getId() == id && usuario instanceof Cliente)
                .findFirst()
                .orElse(null);
    }

    public static Admin obtenerAdminPorId(int id) {
        return (Admin) usuarios.stream()
                .filter(usuario -> usuario.getId() == id && usuario instanceof Admin)
                .findFirst()
                .orElse(null);
    }

    public static void eliminarClientePorId(int id) {
        usuarios.removeIf(usuario -> usuario.getId() == id && usuario instanceof Cliente);
    }

    public static void eliminarAdminPorId(int id) {
        usuarios.removeIf(usuario -> usuario.getId() == id && usuario instanceof Admin);
    }

    public static void agregarCliente(Usuario cliente) {
        usuarios.add(cliente);
    }

    public static void agregarAdmin(Usuario admin) {
        usuarios.add(admin);
    }

    public static boolean validarRut(String rut) {
        rut = rut.replace(".", "").replace("-", "");
        if (rut.length() < 9) {
            return false;
        }

        char dv = rut.charAt(rut.length() - 1);
        String rutNumeros = rut.substring(0, rut.length() - 1);

        try {
            int rutParsed = Integer.parseInt(rutNumeros);
            int m = 0, s = 1;
            for (; rutParsed != 0; rutParsed /= 10) {
                s = (s + rutParsed % 10 * (9 - m++ % 6)) % 11;
            }
            char dvEsperado = (char) (s != 0 ? s + 47 : 75);

            return Character.toUpperCase(dv) == Character.toUpperCase(dvEsperado);
        } catch (NumberFormatException e) {
            return false;
        }
    }


}
