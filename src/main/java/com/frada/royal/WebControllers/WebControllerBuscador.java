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
@RequestMapping("/buscador/*")
public class WebControllerBuscador extends ControladorFuncionesComunes {
    
    @RequestMapping(value="", method=RequestMethod.GET)
    public ModelAndView viewRegistro( HttpServletRequest request ) {
        ModelAndView result = new ModelAndView("buscador");
        cargaContenidoComun(request, result);

        return result;
    } 
}
