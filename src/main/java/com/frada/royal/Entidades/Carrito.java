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
    
    private int     idMesa;
    private int     idPedido;
    private int     ocupantes;
    private int     turno;
    private int     numeromesa;
    private List<Producto> lproductos;
    private String  fecha;
    private Mesa    mesa;
    private String  nombre;
    private String  apellidos;
    private int     idComanda;
    private double  dineroPagado;
    private double  factura;
    private int     pagado;

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

    public int getIdComanda() {
        return idComanda;
    }

    public void setIdComanda(int idDisponibilidad) {
        this.idComanda = idDisponibilidad;
    }
    
    public double getDineroTotal() {
        double dineroTotal = 0;
        for(Producto producto : lproductos) {
            dineroTotal = dineroTotal + producto.getPrecioTotal();
        }
        return dineroTotal;
    }

    public double getDineroPagado() {
        return dineroPagado;
    }

    public void setDineroPagado(double dineroPagado) {
        this.dineroPagado = dineroPagado;
    }

    public double getFactura() {
        return factura;
    }

    public void setFactura(double factura) {
        this.factura = factura;
    }

    public int getPagado() {
        return pagado;
    }

    public void setPagado(int pagado) {
        this.pagado = pagado;
    }
    
    public String isPagado() {
        if(this.pagado == 1) {
            return "Sí";
        } else {
            return "No";
        }
    }
    
}
