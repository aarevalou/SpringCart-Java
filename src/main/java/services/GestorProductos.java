package services;

import models.Producto;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

public class GestorProductos {
    public static  ArrayList<Producto> productos;
    public static ArrayList<String> marcas;
    public static ArrayList<String> categorias;

    public static void setMarcas() {
        marcas = new ArrayList<>();
        for (int i = 0; i < GestorMySQL.obtenerCantidadRegistros("Marca"); i++) {
            HashMap<String, String> marca = GestorMySQL.obtenerRegistro("Marca", "id", String.valueOf(i+1));
            String nombre = marca.get("nombre");
            marcas.add(nombre);
        }
    }
    public static void setCategorias() {
        categorias = new ArrayList<>();
        for (int i = 0; i < GestorMySQL.obtenerCantidadRegistros("Categoria"); i++) {
            HashMap<String, String> categoria = GestorMySQL.obtenerRegistro("Categoria", "id", String.valueOf(i+1));
            String nombre = categoria.get("nombre");
            categorias.add(nombre);
        }
    }
    public static void setProductos() {
        productos = new ArrayList<>();
        String tabla = "Producto";
        for (int i = 0; i < GestorMySQL.obtenerCantidadRegistros(tabla); i++) {
            HashMap<String, String> registros = GestorMySQL.obtenerRegistro(tabla, "id", String.valueOf(i+1));
            Producto producto = new Producto();
            producto.setId(Integer.parseInt(registros.get("id")));
            producto.setMarca_id(Integer.parseInt(registros.get("marca_id")));
            producto.setCategoria_id(Integer.parseInt(registros.get("categoria_id")));
            producto.setPrecio(Integer.parseInt(registros.get("precio")));
            producto.setStock(Integer.parseInt(registros.get("stock")));
            producto.setDetalle(registros.get("detalle"));
            productos.add(producto);
        }
    }
    public static ArrayList<String> getCategorias() { return categorias; }
    public static ArrayList<Producto> getProductos() { return productos; }
    public static ArrayList<String> getMarcas() { return marcas; }
    public static void actualizarDatos() {
        setProductos();
        setCategorias();
        setMarcas();
    }
    public static List<Producto> obtenerProductosPorCategoria(int categoria) {
        return productos.stream()
                .filter(producto -> producto.getCategoria_id() == categoria)
                .collect(Collectors.toList());
    }

    public static Producto obtenerProductoPorID(int indice){
        return productos.get(indice-1);
    }

    public static List<Producto> obtenerProductosPorMarca(int marca) {
        return productos.stream()
                .filter(producto -> producto.getMarca_id() == marca)
                .collect(Collectors.toList());
    }

    public static List<Producto> obtenerProductosPorPrecioAsc() {
        return productos.stream()
                .sorted(Comparator.comparing(Producto::getPrecio))
                .collect(Collectors.toList());
    }

    public static List<Producto> obtenerProductosPorPrecioDesc() {
        return productos.stream()
                .sorted(Comparator.comparing(Producto::getPrecio).reversed())
                .collect(Collectors.toList());
    }


    public static List<Producto> obtenerProductosPorBusqueda(String busqueda) {
        return productos.stream()
                .filter(producto ->
                        marcas.get(producto.getMarca_id()).toLowerCase().contains(busqueda.toLowerCase()) ||
                                producto.getDetalle().toLowerCase().contains(busqueda.toLowerCase()))
                .collect(Collectors.toList());
    }

    public static void eliminarProductoPorId(int id) {
        productos.removeIf(producto -> producto.getId() == id);
    }

    public static void agregarProducto(Producto producto){
        productos.add(producto);
    }

}