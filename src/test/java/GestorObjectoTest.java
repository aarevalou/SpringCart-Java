import services.GestorObjeto;
import models.Cliente;
import org.junit.jupiter.api.Test;
import java.util.HashMap;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

public class GestorObjectoTest {

    @Test
    public void testConstruirObjeto(){
        HashMap<String, String> atributosCliente = new HashMap<>();
        atributosCliente.put("rut", "206695846");
        atributosCliente.put("nombre", "Alejandro Arévalo Carrillo");
        atributosCliente.put("email", "email1@gmail.com");
        Cliente cliente = (Cliente) GestorObjeto.construirObjeto(new Cliente(), atributosCliente);

        assertEquals("206695846", cliente.getRut());
        assertEquals("Alejandro Arévalo Carrillo", cliente.getNombre());
        assertEquals("email1@gmail.com", cliente.getEmail());
    }

}
