import static org.junit.Assert.*;

import models.Producto;
import org.junit.Before;
import org.junit.Test;
import services.GestorProductos;

import java.util.ArrayList;
import java.util.List;

public class GestorProductosTest {

    @Before
    public void setUp() {
        List<Producto> productos = new ArrayList<>();

        Producto producto = new Producto();
        producto.setId(1);
        producto.setMarca_id(1);
        producto.setCategoria_id(1);
        producto.setPrecio(100);
        producto.setStock(10);
        producto.setDetalle("Producto de prueba");

        productos.add(producto);

        GestorProductos.productos = new ArrayList<>(productos);
    }

    @Test
    public void testObtenerProductosPorCategoria() {
        List<Producto> productosPorCategoria = GestorProductos.obtenerProductosPorCategoria(1);
        assertEquals(1, productosPorCategoria.size());
        assertEquals(1, productosPorCategoria.get(0).getCategoria_id());
    }

    @Test
    public void testObtenerProductoPorID() {
        Producto producto = GestorProductos.obtenerProductoPorID(1);
        assertNotNull(producto);
        assertEquals(1, producto.getId());
    }

    @Test
    public void testObtenerProductosPorMarca() {
        List<Producto> productosPorMarca = GestorProductos.obtenerProductosPorMarca(1);
        assertEquals(1, productosPorMarca.size());
        assertEquals(1, productosPorMarca.get(0).getMarca_id());
    }

    @Test
    public void testObtenerProductosPorPrecioAsc() {
        List<Producto> productosPorPrecioAsc = GestorProductos.obtenerProductosPorPrecioAsc();
        assertEquals(1, productosPorPrecioAsc.size());
        assertEquals(1, productosPorPrecioAsc.get(0).getId());
    }

    @Test
    public void testObtenerProductosPorPrecioDesc() {
        List<Producto> productosPorPrecioDesc = GestorProductos.obtenerProductosPorPrecioDesc();
        assertEquals(1, productosPorPrecioDesc.size());
        assertEquals(1, productosPorPrecioDesc.get(0).getId());
    }

    @Test
    public void testAgregarProducto() {
        Producto nuevoProducto = new Producto();
        nuevoProducto.setId(2);
        nuevoProducto.setMarca_id(2);
        nuevoProducto.setCategoria_id(2);
        nuevoProducto.setPrecio(200);
        nuevoProducto.setStock(20);
        nuevoProducto.setDetalle("Nuevo producto");
        GestorProductos.agregarProducto(nuevoProducto);

        assertEquals(nuevoProducto, GestorProductos.obtenerProductoPorID(2));
    }
}
