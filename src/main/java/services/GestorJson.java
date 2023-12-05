package services;

import com.google.gson.Gson;

public class GestorJson {

    public static String convertirAJson(Object objeto) {
        return new Gson().toJson(objeto);
    }

    public static <T> T convertirDesdeJson(String json, Class<T> claseObjeto) {
        return new Gson().fromJson(json, claseObjeto);
    }
}
