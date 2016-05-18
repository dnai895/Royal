/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.frada.royal.Gestores;

import com.frada.royal.BBDDMapper.MesasMapper;
import com.frada.royal.Entidades.Mesa;
import com.frada.royal.Utilidades.General;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

/**
 *
 * @author Dani
 */
@Component
public class GestorMesas {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public Mesa getMesa(int idMesa, int idRestaurante) {
        List<Mesa> lmesas = null;
        try {
            String query = "SELECT idRestaurante, idMesa, numero "
                    + "FROM mesas "
                    + "WHERE idMesa = ? AND idRestaurante = ? AND visible = 1 ";
            lmesas = jdbcTemplate.query(query, new MesasMapper(), new Object[]{idMesa, idRestaurante});
        } catch(Exception e) {
            General.log("GestorMesas", "ERROR en getMesas: "+e.getMessage());
        }
        if(lmesas != null && lmesas.size() > 0 && lmesas.get(0) != null) {
            return lmesas.get(0);
        } else {
            return new Mesa();
        }
    }
    
    public List<Mesa> getMesas(int idRestaurante) {
        List<Mesa> lmesas = null;
        try {
            String query = "SELECT idRestaurante, idMesa, numero "
                         + "FROM mesas "
                         + "WHERE idRestaurante = ? AND visible = 1 ";
            General.log("GestorMesa", "getMesas query: "+query+" idRestaurante: "+idRestaurante);
            lmesas = jdbcTemplate.query(query, new MesasMapper(), new Object[]{idRestaurante});
        } catch(Exception e) {
            General.log("GestorMesas", "ERROR en getMesas: "+e.getMessage());
        }
        return lmesas;
    }
    
    public List<Mesa> getDisponibiliadMesas(int idRestaurante) {
        List<Mesa> lmesas = null;
        try {
            String query = "SELECT idRestaurante, idMesa, numero, ocupada, disponibilidad "
                         + "FROM mesas m "
                         + "LEFT JOIN DISPONIBILIDAD_MESAS dm ON dm.idMesa = m.idMesa "
                         + "WHERE idRestaurante = ? AND visible = 1 AND turno = ? AND fecha = ?";
            General.log("GestorMesa", "getMesas query: "+query+" idRestaurante: "+idRestaurante);
            lmesas = jdbcTemplate.query(query, new MesasMapper(), new Object[]{idRestaurante});
        } catch(Exception e) {
            General.log("GestorMesas", "ERROR en getDisponibiliadMesas: "+e.getMessage());
        }
        return lmesas;
    }
    
    public void insertaMesa(Mesa mesa) {
        try {
            String query = "INSERT INTO mesas (idRestaurante, numero, visible) VALUES (?,?,1)";
            jdbcTemplate.update(query, new Object[]{mesa.getIdRestaurante(), mesa.getNumero()});
        } catch(Exception e) {
            General.log("GestorMesas", "ERROR en insertaMesa: "+e.getMessage());
        }
    }
    
    public void modificaMesa(Mesa mesa) {
        try {
            String query = "UPDATE mesas SET numero = ? WHERE idMesa = ? AND idRestaurante = ?";
            jdbcTemplate.update(query, new Object[]{mesa.getNumero(),
                                                    mesa.getIdMesa(), mesa.getIdRestaurante()});
        } catch(Exception e) {
            General.log("GestorMesas", "ERROR en insertaMesa: "+e.getMessage());
        }
    }
    
    public void escondeMesa(int idMesa, int idRestaurante) {
        try {
            String query = "UPDATE mesas SET visible = 0 WHERE idMesa = ? AND idRestaurante = ?";
            jdbcTemplate.update(query, new Object[]{idMesa, idRestaurante});
        } catch(Exception e) {
            General.log("GestorMesas", "ERROR en insertaMesa: "+e.getMessage());
        }
    }
    
}
