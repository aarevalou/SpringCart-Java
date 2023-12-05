import services.GestorMySQL;
import models.Admin;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;
import java.util.ArrayList;
import java.util.HashMap;

public class GestorSQliteTest {


    @BeforeAll
    public static void conexion(){
        GestorMySQL.ActualizarConexion();
    }

    @BeforeEach
    public void setUp() {
        Admin admin = new Admin(1, "33444555-K", "Alejandro Arévalo Sanchez", "a.arevalo02@ufromail.cl", "1234", "Boldo 10143", "Productos y Pedidos", "18/07/2023");
    }

    @Test
    public void testEjecutarSQL() {
        String sql = "SELECT * FROM Producto";
        GestorMySQL.ejecutarSQL(sql);
        assertDoesNotThrow(() -> GestorMySQL.ejecutarSQL(sql));
    }

    @Test
    public void testInsertarRegistro(){
        String tabla = "Marca";
        HashMap<String, String> nombre_valor = new HashMap<>();
        nombre_valor.put("nombre", "'Presonus'");
        assertDoesNotThrow(() -> GestorMySQL.insertarRegistro(tabla, nombre_valor));
    }

    @Test
    public void testEliminarRegistro(){
        String tabla = "Marca";
        String campos = "id, nombre";
        String valores = "7, Presonus";
        assertDoesNotThrow(() -> GestorMySQL.eliminarRegistro(tabla, campos, valores));
    }

    @Test
    public void testFormarCondicionWhere(){
        assertEquals(GestorMySQL.formarCondicionalWhere("id", "1"), " WHERE id = 1 ");
        assertEquals(GestorMySQL.formarCondicionalWhere("id,nombre,email", "1,Alejandro,email@gmail.com"), " WHERE id = 1 AND nombre = 'Alejandro' AND email = 'email@gmail.com' ");
    }

    @Test
    public void testConcatenarCampos(){
        ArrayList<String> campos = new ArrayList<>();
        campos.add("id");
        campos.add("nombre");
        campos.add("email");
        assertEquals(GestorMySQL.concatenarCampos(campos), "id, nombre, email");
    }
}
