/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.frada.royal.Gestores;

import com.frada.royal.BBDDMapper.ComandasMapper;
import com.frada.royal.BBDDMapper.Int_StringMapper;
import com.frada.royal.BBDDMapper.ProductoMapper;
import com.frada.royal.BBDDMapper.RestauranteMapper;
import com.frada.royal.Entidades.Carrito;
import com.frada.royal.Entidades.Int_String;
import com.frada.royal.Entidades.Producto;
import com.frada.royal.Entidades.Restaurante;
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
public class GestorRestaurante {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public Restaurante getRestaurante(String username) {
        List<Restaurante> lrest = null;
        try {
            String query = "SELECT idRestaurante, nombre, direccion, telefono, latitud, longitud, "
                    + "username, web, email, intro, descripcion, aforo "
                    + "FROM restaurante "
                    + "WHERE username = ? "
                    + "LIMIT 1";
            lrest = jdbcTemplate.query(query, new RestauranteMapper(), new Object[]{username});
        } catch(Exception e) {
            General.log("GestorRestaurante", "ERROR en getRestaurante: "+e.getMessage());
        }
        if(lrest != null && lrest.size() > 0 && lrest.get(0) != null && lrest.get(0).getUsername().equals(username)) {
            return lrest.get(0);
        } else {
            return new Restaurante();
        }
    }
    
    public Restaurante getRestaurante(int idRestaurante) {
        List<Restaurante> lrest = null;
        try {
            String query = "SELECT idRestaurante, nombre, direccion, telefono, latitud, longitud, "
                    + "username, web, email, intro, descripcion, aforo "
                    + "FROM restaurante "
                    + "WHERE idRestaurante = ? "
                    + "LIMIT 1";
            lrest = jdbcTemplate.query(query, new RestauranteMapper(), new Object[]{idRestaurante});
        } catch(Exception e) {
            General.log("GestorRestaurante", "ERROR en getRestaurante: "+e.getMessage());
        }
        if(lrest != null && lrest.size() > 0 && lrest.get(0) != null) {
            return lrest.get(0);
        } else {
            return new Restaurante();
        }
    }
   
    public List<Producto> getProductos(int idRestaurante, int idTipoPlato) {
        List<Producto> lproductos = null;
        try {
            String query = "SELECT idRestaurante, idProducto, p.nombre as nombreProducto, precio, descripcion, tp.idTipoProducto,"
                    + "tp.nombre as nombreTipoProducto "
                    + "FROM producto p "
                    + "LEFT JOIN tipo_producto tp ON tp.idTipoProducto = p.idTipoProducto "
                    + "WHERE idRestaurante = ? AND tp.idTipoProducto = ? AND visible = 1";
            lproductos = jdbcTemplate.query(query, new ProductoMapper(), new Object[]{idRestaurante, idTipoPlato});
        } catch(Exception e) {
            General.log("GestorRestaurante", "ERROR en getProductos: "+e.getMessage());
        } 
        return lproductos;
    }
    
    public Producto getProducto(int idProducto) {
        List<Producto> lproductos = null;
        try {
            String query = "SELECT idRestaurante, idProducto, p.nombre as nombreProducto, precio, descripcion, tp.idTipoProducto,"
                    + "tp.nombre as nombreTipoProducto "
                    + "FROM PRODUCTO p "
                    + "LEFT JOIN TIPO_PRODUCTO tp ON tp.idTipoProducto = p.idTipoProducto "
                    + "WHERE idProducto = ? AND visible = 1 "
                    + "LIMIT 1";
            lproductos = jdbcTemplate.query(query, new ProductoMapper(), new Object[]{idProducto});
        } catch(Exception e) {
            General.log("GestorRestaurante", "ERROR en getProducto: "+e.getMessage());
        } 
        if(lproductos != null && lproductos.size() > 0 && lproductos.get(0) != null) {
            return lproductos.get(0);
        } else {
            return new Producto();
        }
    }
    
    public List<Int_String> getTipoProductos() {
        List<Int_String> ltipoProductos = null;
        try {
            String query = "SELECT  tp.idTipoProducto,"
                    + "tp.nombre as nombreTipoProducto "
                    + "FROM TIPO_PRODUCTO tp ";
            ltipoProductos = jdbcTemplate.query(query, new Int_StringMapper(), new Object[]{});
        } catch(Exception e) {
            General.log("GestorRestaurante", "ERROR en getTipoProductos: "+e.getMessage());
        } 
        return ltipoProductos;
    }
    
    public void insertaProducto(Producto producto) {
        try {
            String query = "INSERT INTO producto (idRestaurante, nombre, precio, descripcion, idTipoProducto, visible) "
                            + "VALUES (?,?,?,?,?, 1)";
            jdbcTemplate.update(query, new Object[]{producto.getIdRestaurante(), producto.getNombre(), producto.getPrecio(), 
                                                    producto.getDescripcion(), producto.getIdTipoProducto()});
        } catch(Exception e) {
            General.log("GestorRestaurante", "ERROR en registraUsuario: "+e.getMessage());
        }
    }
    
    public void modificaProducto(Producto producto) {
        try {
            String query = "UPDATE PRODUCTO SET nombre = ?, precio = ?, descripcion = ?, idTipoProducto = ? "
                    + "WHERE idProducto = ? AND idRestaurante ";
            jdbcTemplate.update(query, new Object[]{producto.getNombre(), producto.getPrecio(), 
                            producto.getDescripcion(), producto.getIdTipoProducto(), producto.getIdProducto(),
                            producto.getIdRestaurante()});
        } catch(Exception e) {
            General.log("GestorRestaurante", "ERROR en registraUsuario: "+e.getMessage());
        }
    }
    
    public void escondeProducto(int idProducto, int idRestaurante) {
        try {
            String query = "UPDATE PRODUCTO SET visible = 0 "
                    + "WHERE idProducto = ? AND idRestaurante = ?";
            jdbcTemplate.update(query, new Object[]{idProducto, idRestaurante});
        } catch(Exception e) {
            General.log("GestorRestaurante", "ERROR en registraUsuario: "+e.getMessage());
        }
    }
    
    public List<Restaurante> getRestaurantes() {
        List<Restaurante> lrestaurantes = null;
        try {
            String query = "SELECT idRestaurante, nombre, direccion, telefono, latitud, longitud, "
                         + "username, web, email, intro, descripcion, aforo "
                         + "FROM RESTAURANTE "
                         + "ORDER BY nombre ";
            lrestaurantes = jdbcTemplate.query(query, new RestauranteMapper(), new Object[]{});
        } catch(Exception e) {
            General.log("GestorRestaurante", "ERROR en getRestaurantes: "+e.getMessage());
        }
        return lrestaurantes;
    }
    
    public void setDatosBusqueda(Restaurante restaurante) {
        String query = "UPDATE RESTAURANTE SET descripcion = ?, intro = ?, latitud = ?, longitud = ? "
                + "WHERE idRestaurante = ?";
        jdbcTemplate.update(query, new Object[]{restaurante.getDescripcion(), restaurante.getIntro(),
            restaurante.getLatitud(), restaurante.getLongitud(), restaurante.getIdRestaurante()});
    }
    
    public boolean compruebaDisponibilidad(int idRestaurante, String fecha, int turno, int personas, int aforo) {
        boolean response = false;
        int ocupantes = 0;
        try {
            String query = ""
                    + "SELECT SUM(ocupantes) "
                    + "FROM COMANDA "
                    + "WHERE idRestaurante = ? AND fecha = ? AND turno = ?";
            ocupantes = jdbcTemplate.queryForInt(query, new Object[]{idRestaurante, fecha, turno});
        } catch(Exception e) {
            General.log("GestorRestaurante", "ERROR en compruebaDisponibilidad: "+e.getMessage());
        }
        
        if((ocupantes + personas) <= aforo) {
            response = true;
        }
        return response;
    }
    
    public int getIdComanda(long aleatorio) {
        int idDisponibilidad = 0;
        try {
            String query = ""
                    + "SELECT idComanda "
                    + "FROM COMANDA "
                    + "WHERE aleatorio = ?";
            idDisponibilidad = jdbcTemplate.queryForInt(query, new Object[]{aleatorio});
        } catch(Exception e) {
            General.log("GestorRestaurante", "ERROR en getIdComanda: "+e.getMessage());
        }
        return idDisponibilidad;
    }
    
    public long guardaReserva(int idRestaurante, String fecha, int turno, int personas, String nombre, String apellidos) {
        long aleatorio = (int) (Math.random()*100000);
        try {
            String query = ""
                    + "INSERT INTO COMANDA (idRestaurante, ocupantes, fecha, turno, nombre, apellidos, idMesa, aleatorio, pagado) "
                    + "VALUES (?,?,?,?,?,?,?,?,0)";
            jdbcTemplate.update(query, new Object[]{idRestaurante, personas, fecha, turno, nombre, apellidos, 0, aleatorio});
        } catch(Exception e) {
            General.log("GestorRestaurante", "ERROR en guardaReserva: "+e.getMessage());
        }
        return aleatorio;
    }
    
    public void guardaDineroTotalCarrito(Carrito carrito) {
        try {
            String query = ""
                    + "UPDATE COMANDA "
                    + "SET dineroTotal = ? "
                    + "WHERE idComanda = ?";
            jdbcTemplate.update(query, new Object[]{carrito.getDineroTotal(), carrito.getIdComanda()});
        } catch(Exception e) {
            General.log("GestorRestaurante", "ERROR en guardaDineroTotalCarrito: "+e.getMessage());
        }
    }
    
    public void guardaProducto(Producto producto) {
        try {
            String query = ""
                    + "INSERT INTO PEDIDO (idRestaurante, unidades, idComanda, idProducto) "
                    + "VALUES (?,?,?,?)";
            jdbcTemplate.update(query, new Object[]{producto.getIdRestaurante(), producto.getUnidades(), 
                producto.getIdComanda(), producto.getIdProducto()});
        } catch(Exception e) {
            General.log("GestorRestaurante", "ERROR en guardaProducto: "+e.getMessage());
        }
    }
    
    public List<Carrito> getPedidos(int idRestaurante, String fechaInicio, String fechaFin, int isPagado, int turno) {
        List<Carrito> lpedidos = null;
        String filtroFechaInicio    = ""; 
        String filtroFechaFin       = "";
        String filtroPagado         = "";
        String filtroTurno          = "";
        if(fechaInicio != null && !fechaInicio.isEmpty()) {
            filtroFechaInicio = " AND fecha >= '"+fechaInicio+"' ";
        }
        if(fechaFin != null && !fechaFin.isEmpty()) {
            filtroFechaFin = " AND fecha <= '"+fechaFin+"' ";
        }
        if(isPagado != -1) {
            filtroPagado = " AND pagado = "+isPagado+" ";
        }
        if(turno != -1) {
            filtroTurno = " AND turno = "+turno+" ";
        }
        try {
            String query = ""
                    + "SELECT idRestaurante, idComanda, fecha, pagado, dineroPagado, dineroTotal, ocupantes, turno,"
                    + "nombre, apellidos "
                    + "FROM COMANDA c "
                    + "WHERE idRestaurante = ? "+filtroFechaInicio+filtroFechaFin+filtroTurno+filtroPagado
                    + "ORDER BY fecha ";
            General.log("GestorRestaurante", "getPedidos query : "+query);
            lpedidos = jdbcTemplate.query(query, new ComandasMapper(), new Object[]{idRestaurante});
        } catch (Exception e) {
            General.log("GestorRestaurante", "ERROR en getPedidos: "+e.getMessage());
        }
        return lpedidos;
    }
    
    public void marcarPedidoPagado(int idRestaurante, int idComanda) {
        try {
            String query = "UPDATE COMANDA SET pagado = 1 WHERE idRestaurante = ? AND idComanda = ?";
            jdbcTemplate.update(query, new Object[]{idRestaurante, idComanda});
        } catch(Exception e) {
            General.log("GestorRestaurante", "ERROR en marcarPedidoPagado: "+e.getMessage());
        }
    } 
}
