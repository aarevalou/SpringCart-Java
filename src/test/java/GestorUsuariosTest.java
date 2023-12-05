import static org.junit.Assert.*;

import models.Admin;
import models.Cliente;
import models.Usuario;
import org.junit.Before;
import org.junit.Test;
import services.GestorUsuarios;

import java.util.ArrayList;
import java.util.List;

public class GestorUsuariosTest {

    @Before
    public void setUp() {
        List<Usuario> usuarios = new ArrayList<>();

        Cliente cliente = new Cliente();
        cliente.setId(1);
        cliente.setNombre("Cliente de Prueba");
        usuarios.add(cliente);

        Admin admin = new Admin();
        admin.setId(2);
        admin.setNombre("Admin de Prueba");
        usuarios.add(admin);

        GestorUsuarios.usuarios = new ArrayList<>(usuarios);
    }

    @Test
    public void testObtenerClientes() {
        List<Usuario> clientes = GestorUsuarios.obtenerClientes();
        assertEquals(1, clientes.size());
        assertTrue(clientes.get(0) instanceof Cliente);
    }

    @Test
    public void testObtenerClientePorId() {
        Cliente cliente = GestorUsuarios.obtenerClientePorId(1);
        assertNotNull(cliente);
        assertEquals(1, cliente.getId());
    }

    @Test
    public void testObtenerAdminPorId() {
        Admin admin = GestorUsuarios.obtenerAdminPorId(2);
        assertNotNull(admin);
        assertEquals(2, admin.getId());
    }

    @Test
    public void testEliminarClientePorId() {
        GestorUsuarios.eliminarClientePorId(1);
        assertNull(GestorUsuarios.obtenerClientePorId(1));
    }

    @Test
    public void testEliminarAdminPorId() {
        GestorUsuarios.eliminarAdminPorId(2);
        assertNull(GestorUsuarios.obtenerAdminPorId(2));
    }

    @Test
    public void testAgregarCliente() {
        Cliente nuevoCliente = new Cliente();
        nuevoCliente.setId(3);
        nuevoCliente.setNombre("Nuevo Cliente");
        GestorUsuarios.agregarCliente(nuevoCliente);
        assertEquals(nuevoCliente, GestorUsuarios.obtenerClientePorId(3));
    }

    @Test
    public void testAgregarAdmin() {
        Admin nuevoAdmin = new Admin();
        nuevoAdmin.setId(4);
        nuevoAdmin.setNombre("Nuevo Admin");
        GestorUsuarios.agregarAdmin(nuevoAdmin);
        assertEquals(nuevoAdmin, GestorUsuarios.obtenerAdminPorId(4));
    }
}
