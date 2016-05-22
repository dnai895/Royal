/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.frada.royal.WebControllers;

import com.frada.royal.Entidades.Carrito;
import java.util.List;
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
@RequestMapping("/pedidos/*")
public class WebControllerPedidos extends ControladorFuncionesComunes {
    
    @RequestMapping(value = "reservas", method = RequestMethod.GET)
    public ModelAndView viewData(HttpServletRequest request) {
        ModelAndView result = new ModelAndView("paginasRestaurante/listadoComandas");
        cargaContenidoComun(request, result);
        if (restaurante.isLogado()) {
            String fechaInicio  = getParametroString("fechaInicio", request);
            String fechaFin     = getParametroString("fechaFin", request);
            int turno           = getParametroIntDefectoMenosUno("turno", request);
            int pagado          = getParametroIntDefectoMenosUno("pagado", request);
            
            result.addObject("fechaInicio", fechaInicio);
            result.addObject("fechaFin", fechaFin);
            result.addObject("turno", turno);
            result.addObject("pagado", pagado);
            
            if(!fechaInicio.isEmpty()) {
                String afecha[] = fechaInicio.split("/");
                fechaInicio = afecha[2]+"-"+afecha[1]+"-"+afecha[0];
            }
            if(!fechaFin.isEmpty()) {
                String afecha[] = fechaFin.split("/");
                fechaFin = afecha[2]+"-"+afecha[1]+"-"+afecha[0];
            }
            
            List<Carrito> lcomandas = gRestaurante.getPedidos(restaurante.getIdRestaurante(), fechaInicio, fechaFin, pagado, turno);
            result.addObject("lcomandas", lcomandas);
        } else {
            muestraPaginaError(result);
        }
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value = "marcar-pagado", method = RequestMethod.POST)
    public String marcarPagado(HttpServletRequest request) {
        ModelAndView result = new ModelAndView("paginasRestaurante/listadoComandas");
        cargaContenidoComun(request, result);
        String response = "nok";
        if (restaurante.isLogado()) {
            int idComanda = getParametroInt("idComanda", request);
            gRestaurante.marcarPedidoPagado(restaurante.getIdRestaurante(), idComanda);
            response = "ok";
        } 
        return response;
    }
    
}
