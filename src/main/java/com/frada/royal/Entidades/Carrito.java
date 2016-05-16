/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.frada.royal.Entidades;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Dani
 */
public class Carrito implements Serializable {
    
    private int idMesa;
    private int numeromesa;
    private List<Producto> lproductos;
    private Mesa mesa;

    public int getIdMesa() {
        return idMesa;
    }

    public void setIdMesa(int idMesa) {
        this.idMesa = idMesa;
    }

    public int getNumeromesa() {
        return numeromesa;
    }

    public void setNumeromesa(int numeromesa) {
        this.numeromesa = numeromesa;
    }

    public List<Producto> getLproductos() {
        return lproductos;
    }

    public void setLproductos(List<Producto> lproductos) {
        this.lproductos = lproductos;
    }

    public Mesa getMesa() {
        return mesa;
    }

    public void setMesa(Mesa mesa) {
        this.mesa = mesa;
    }
    
    
}
