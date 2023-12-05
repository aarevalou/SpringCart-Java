package services;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;

public class GestorObjeto {

    public static Object construirObjeto(Object obj, HashMap<String, String> nombre_valor) {
        Class<?> claseObjeto = obj.getClass();

        for (HashMap.Entry<String, String> entry : nombre_valor.entrySet()) {
            String nombreAtributo = entry.getKey();
            String valorAtributo = entry.getValue();
            try {
                String nombreSetter = "set" + nombreAtributo.substring(0, 1).toUpperCase() + nombreAtributo.substring(1);
                Method setter;
                try{
                    setter = claseObjeto.getMethod(nombreSetter, int.class);
                    setter.invoke(obj, Integer.parseInt(valorAtributo));
                }catch (NoSuchMethodException e){
                    setter = claseObjeto.getMethod(nombreSetter, String.class);
                    setter.invoke(obj, valorAtributo);
                }
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        } return obj;
    }

    public static HashMap<String, String> obtenerAtributosObjeto(Object objeto) {
        HashMap<String, String> atributos = new HashMap<>();
        Field[] campos = objeto.getClass().getDeclaredFields();

        for (Field campo : campos) {
            if (!campo.getName().equals("id")) {
                campo.setAccessible(true);

                try {
                    Object valorCampo = campo.get(objeto);

                    if (valorCampo != null) {
                        String nombreCampo = campo.getName();
                        String valorCampoString;

                        if (campo.getType().equals(String.class)) {
                            valorCampoString = (String) valorCampo;
                        } else if (campo.getType().isPrimitive()) {
                            valorCampoString = String.valueOf(valorCampo);
                        } else {
                            valorCampoString = valorCampo.toString();
                        }

                        atributos.put(nombreCampo, valorCampoString);
                    }
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
        }
        return atributos;
    }

}
