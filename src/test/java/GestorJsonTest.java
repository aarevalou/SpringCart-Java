import com.google.gson.Gson;
import models.Producto;
import org.junit.Test;
import services.GestorJson;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class GestorJsonTest {

    @Test
    public void testConvertirAJson() {
        Producto producto = new Producto(39, 33, "Monster Energy Original 500ml", 2590, 12, 8);

        String json = GestorJson.convertirAJson(producto);
        String gsonJson = new Gson().toJson(producto);
        assertEquals(gsonJson, json);
    }


    @Test
    public void testVerificarStock() {

        Producto productoConStock = new Producto(39, 33, "Monster Energy Original 500ml", 2590, 5, 8);
        Producto productoSinStock = new Producto(39, 33, "Monster Energy Original 500ml", 2590, 0, 8);

        assertTrue(productoConStock.verificarStock());
        assertTrue(!productoSinStock.verificarStock());
    }
}
