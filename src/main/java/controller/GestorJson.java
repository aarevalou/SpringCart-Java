package controller;

import com.google.gson.Gson;

public class GestorJson {

    public static String convertirAJson(Object objeto) {
        return new Gson().toJson(objeto);
    }
}
