/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.frada.royal.WebControllers;

import com.frada.royal.Entidades.Restaurante;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
 *
 * @author Dani
 */
@Controller
@RequestMapping("/*")
public class ControladorRaiz extends ControladorFuncionesComunes {
        
    @RequestMapping(value="", method=RequestMethod.GET)
    public ModelAndView index( HttpServletRequest request ) {
        ModelAndView result = new ModelAndView("landing");       
        cargaContenidoComun(request, result);
        return result;
    } 
    
    @RequestMapping(value="error", method=RequestMethod.GET)
    public ModelAndView error( HttpServletRequest request ) {
        ModelAndView result = new ModelAndView("error");       
        cargaContenidoComun(request, result);
        return result;
    }     
    
    @RequestMapping(value="landing", method=RequestMethod.GET)
    public ModelAndView landing( HttpServletRequest request ) {
        ModelAndView result = new ModelAndView("landing");
        cargaContenidoComun(request, result);
        return result;
    } 
    
    @RequestMapping(value="lista-restaurantes", method=RequestMethod.GET)
    public ModelAndView listaRestaurantes( HttpServletRequest request ) {
        ModelAndView result = new ModelAndView("landing");
        cargaContenidoComun(request, result);
        return result;
    } 
    
    @RequestMapping(value="{idRestaurante}/{nombreRestaurante}", method=RequestMethod.GET)
    public ModelAndView homeRestaurante(@PathVariable int idRestaurante, @PathVariable String nombre, HttpServletRequest request ) {
        ModelAndView result = new ModelAndView("landing");
        cargaContenidoComun(request, result);
        Restaurante rest = gRestaurante.getRestaurante(idRestaurante);
        result.addObject("rest", rest);
        return result;
    } 
}