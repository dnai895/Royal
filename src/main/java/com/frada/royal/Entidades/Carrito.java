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
    private int idPedido;
    private int ocupantes;
    private int turno;
    private int numeromesa;
    private List<Producto> lproductos;
    private String fecha;
    private Mesa mesa;
    private String nombre;
    private String apellidos;
    private int idDisponibilidad;

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

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public int getOcupantes() {
        return ocupantes;
    }

    public void setOcupantes(int ocupantes) {
        this.ocupantes = ocupantes;
    }

    public int getTurno() {
        return turno;
    }

    public void setTurno(int turno) {
        this.turno = turno;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public int getIdDisponibilidad() {
        return idDisponibilidad;
    }

    public void setIdDisponibilidad(int idDisponibilidad) {
        this.idDisponibilidad = idDisponibilidad;
    }
    
    
}
