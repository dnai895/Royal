/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.frada.royal.Entidades;

import java.io.Serializable;
import org.springframework.stereotype.Component;

/**
 *
 * @author Dani
 */
public class Restaurante implements Serializable {
    
    private int     idRestaurante;
    private String  username;
    private String  password;
    private String  cfpassword;
    
    // Datos del comercio
    private String  nombre;
    private String  nombreUrl;
    private String  direccion;
    private String  telefono;
    private String  web;
    private String  email;
    
    private String  descripcion;
    private String  intro;
    
    // Localizacion
    private String  latitud;
    private String  longitud;
    
    private String fecha;
    
    private boolean logado;

    public Restaurante() {
    }

    public int getIdRestaurante() {
        return idRestaurante;
    }

    public void setIdRestaurante(int idRestaurante) {
        this.idRestaurante = idRestaurante;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
        setNombreUrl(nombre);
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getWeb() {
        return web;
    }

    public void setWeb(String web) {
        this.web = web;
    }

    public String getLatitud() {
        return latitud;
    }

    public void setLatitud(String latitud) {
        this.latitud = latitud;
    }

    public String getLongitud() {
        return longitud;
    }

    public void setLongitud(String longitud) {
        this.longitud = longitud;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCfpassword() {
        return cfpassword;
    }

    public void setCfpassword(String cfpassword) {
        this.cfpassword = cfpassword;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public boolean isLogado() {
        return logado;
    }

    public void setLogado(boolean logado) {
        this.logado = logado;
    }
    
    public void setRestaurante(Restaurante rest) {
        this.setIdRestaurante(rest.getIdRestaurante());
        this.setUsername(rest.getUsername());
        this.setNombre(rest.getNombre());
        this.setEmail(rest.getEmail());
        this.setTelefono(rest.getTelefono());
        this.setDireccion(rest.getDireccion());
        this.setWeb(rest.getWeb());
        this.setLatitud(rest.getLatitud());
        this.setLongitud(rest.getLongitud());
        this.setDescripcion(rest.getDescripcion());
        this.setIntro(rest.getIntro());
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }
    
    public void setNombreUrl(String nombre) {
        this.nombreUrl = nombre;
        this.nombreUrl.replace(" ", "-");
        this.nombreUrl.replace("á", "a");
        this.nombreUrl.replace("à", "a");
        this.nombreUrl.replace("é", "e");
        this.nombreUrl.replace("è", "e");
        this.nombreUrl.replace("í", "i");
        this.nombreUrl.replace("ì", "i");
        this.nombreUrl.replace("ó", "o");
        this.nombreUrl.replace("ò", "o");
        this.nombreUrl.replace("ú", "u");
        this.nombreUrl.replace("ù", "u");
        this.nombreUrl.replace("'", "-");
        this.nombreUrl.replace("\"", "-");
        this.nombreUrl.replace(".", "");
        this.nombreUrl.replace(",", "");
    }
    
    public String getNombreUrl() {
        return this.nombreUrl;
    }
    
}
