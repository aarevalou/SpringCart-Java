package models;

import java.util.HashMap;

public class Producto {

    private int id;
    private int marca_id;
    private String detalle;
    private int precio;
    private int stock;
    private int categoria_id;


    public Producto(){}

    public Producto(int id, int marca, String modelo, int precio, int stock, int categoria) {
        this.id = id;
        this.marca_id = marca;
        this.detalle = modelo;
        this.precio = precio;
        this.stock = stock;
        this.categoria_id = categoria;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMarca_id() {
        return marca_id;
    }

    public void setMarca_id(int marca_id) {
        this.marca_id = marca_id;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }


    public int getCategoria_id() {
        return categoria_id;
    }

    public void setCategoria_id(int categoria_id) {
        this.categoria_id = categoria_id;
    }


    public boolean verificarStock(){
        if(this.stock > 0)
        {
            return true;
        }
        else{
            return false;
        }
    }


    @Override
    public String toString() {
        return "Producto{" +
                ", marca='" + marca_id + '\'' +
                ", modelo='" + detalle + '\'' +
                ", precio=" + precio +
                ", stock=" + stock +
                '}';
    }
}
