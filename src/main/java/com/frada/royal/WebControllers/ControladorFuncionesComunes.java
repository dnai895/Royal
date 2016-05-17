/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.frada.royal.WebControllers;


import com.frada.royal.Entidades.Carrito;
import com.frada.royal.Entidades.Restaurante;
import com.frada.royal.Gestores.GestorMesas;
import com.frada.royal.Gestores.GestorRestaurante;
import com.frada.royal.Gestores.GestorUploadFiles;
import com.frada.royal.Gestores.GestorUsuarios;
import com.frada.royal.Utilidades.Constantes;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Dani
 */
public class ControladorFuncionesComunes {
    
    @Autowired
    protected JdbcTemplate jdbcTemplate;
    
    @Autowired
    protected Restaurante restaurante;
    
    @Autowired
    protected Carrito carrito;
    
    @Autowired
    protected GestorUsuarios gUsuarios;
    
    @Autowired
    protected GestorRestaurante gRestaurante;
    
    @Autowired
    protected GestorMesas gMesas;
    
    @Autowired
    protected GestorUploadFiles gArchivos;
    
    public void cargaContenidoComun(HttpServletRequest request, ModelAndView view) {
        view.addObject("restaurante", restaurante);
        view.addObject("contextpath", Constantes.CONTEXTPATH);
    }
    
    public String getParametroString(String parametro, HttpServletRequest request) {
        String param = "";
        if(request.getParameter(parametro) != null && !request.getParameter(parametro).isEmpty()) {
            param = request.getParameter(parametro);
        }
        return param;
    }
    
    public int getParametroInt(String parametro, HttpServletRequest request) {
        int param = 0;
        if(request.getParameter(parametro) != null && !request.getParameter(parametro).isEmpty()) {
            try {
                param = Integer.parseInt(request.getParameter(parametro));
            } catch (NumberFormatException e) {
                
            }
        }
        return param;
    }
    
    public double getParametroDouble(String parametro, HttpServletRequest request) {
        double param = 0;
        if(request.getParameter(parametro) != null && !request.getParameter(parametro).isEmpty()) {
            try {
                param = Double.parseDouble(request.getParameter(parametro));
            } catch (NumberFormatException e) {
                
            }
        }
        return param;
    }
}
