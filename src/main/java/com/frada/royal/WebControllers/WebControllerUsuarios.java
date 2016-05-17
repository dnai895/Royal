/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.frada.royal.WebControllers;

import com.frada.royal.Entidades.Restaurante;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Dani
 */
@Controller
@RequestMapping("/usuarios/*")
public class WebControllerUsuarios extends ControladorFuncionesComunes {
    
    @RequestMapping(value="registro", method=RequestMethod.GET)
    public ModelAndView viewRegistro( HttpServletRequest request ) {
        ModelAndView result = new ModelAndView("paginasRestaurante/registro");
        cargaContenidoComun(request, result);

        return result;
    } 
    
    @ResponseBody
    @RequestMapping(value="registro", method=RequestMethod.POST)
    public String serviceRegistro( HttpServletRequest request ) {
        ModelAndView result = new ModelAndView("paginasRestaurante/registro");
        cargaContenidoComun(request, result);
        
        String logado = "nok";
        String nombre       = getParametroString("nombre", request);
        String direccion    = getParametroString("direccion", request);
        String telefono     = getParametroString("telefono", request);
        String email        = getParametroString("email", request);
        String username     = getParametroString("username", request);
        String web          = getParametroString("web", request);
        String password     = getParametroString("password", request);
        String cfpassword   = getParametroString("cfpassword", request);
        
        Restaurante rest = new Restaurante();
        rest.setNombre(nombre);
        rest.setDireccion(direccion);
        rest.setTelefono(telefono);
        rest.setUsername(username);
        rest.setWeb(web);
        rest.setEmail(email);
        rest.setPassword(password);
        rest.setCfpassword(cfpassword);
        
        if(gUsuarios.checkDataUsuario(rest)) {
            gUsuarios.registraUsuario(rest);
            restaurante.setRestaurante(rest);
            restaurante.setLogado(true);
            logado = "ok";
        }
        
        return logado;
    } 
    
    @RequestMapping(value="landing", method=RequestMethod.GET)
    public ModelAndView viewLogin( HttpServletRequest request ) {
        ModelAndView result = new ModelAndView("/landing");
        cargaContenidoComun(request, result);

        return result;
    } 
    
    @ResponseBody
    @RequestMapping(value="logout", method=RequestMethod.GET)
    public String serviceLogout( HttpServletRequest request ) {
        ModelAndView result = new ModelAndView("/landing");
        cargaContenidoComun(request, result);
        if(restaurante.isLogado()) {
            restaurante.init();
        }
        return "redirect: /classroyal/";
    } 
    
    @ResponseBody
    @RequestMapping(value="landing", method=RequestMethod.POST)
    public String serviceLogin( HttpServletRequest request ) {
        ModelAndView result = new ModelAndView("/landing");
        cargaContenidoComun(request, result);
        
        String res      = null;
        String username = getParametroString("username", request);
        String password = getParametroString("passwd", request);
        
        boolean logado = gUsuarios.login(username, password);

        if(logado) {
            Restaurante rest = gRestaurante.getRestaurante(username);
            restaurante.setRestaurante(rest);
            restaurante.setLogado(true);
            res = "ok";
        } else {
            res = "nok";
        }                
        return res;
    } 
}
