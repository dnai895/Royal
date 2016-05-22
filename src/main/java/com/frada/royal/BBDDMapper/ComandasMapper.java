/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.frada.royal.BBDDMapper;

import com.frada.royal.Entidades.Carrito;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Dani
 */
public class ComandasMapper implements RowMapper {

    @Override
    public Object mapRow(ResultSet rs, int i) throws SQLException {
        Carrito carrito = new Carrito();
        carrito.setIdComanda(rs.getInt("idComanda"));
        String fecha = rs.getString("fecha");
        String afecha[] = fecha.split("-");
        carrito.setFecha(afecha[2]+"/"+afecha[1]+"/"+afecha[0]);
        carrito.setNombre(rs.getString("nombre"));
        carrito.setApellidos(rs.getString("apellidos"));
        carrito.setOcupantes(rs.getInt("ocupantes"));
        carrito.setTurno(rs.getInt("turno"));
        carrito.setPagado(rs.getInt("pagado"));
        carrito.setDineroPagado(rs.getDouble("dineroPagado"));
        carrito.setFactura(rs.getDouble("dineroTotal"));
        return carrito;
    }
    
}
