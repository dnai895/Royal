/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.frada.royal.BBDDMapper;

import com.frada.royal.Entidades.Mesa;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Dani
 */
public class MesasMapper implements RowMapper {

    @Override
    public Object mapRow(ResultSet rs, int i) throws SQLException {
        Mesa mesa = new Mesa();
        mesa.setIdRestaurante(rs.getInt("idRestaurante"));
        mesa.setIdMesa(rs.getInt("idMesa"));
        mesa.setNumero(rs.getInt("numero"));
        return mesa;
    }
    
}
