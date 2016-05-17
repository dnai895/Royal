/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.frada.royal.WebControllers;

import com.frada.royal.Entidades.Mesa;
import com.frada.royal.Entidades.Producto;
import com.frada.royal.Entidades.Restaurante;
import com.frada.royal.Utilidades.Constantes;
import com.frada.royal.Utilidades.General;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Dani
 */
@Controller
@RequestMapping("/*")
public class WebControllerProcesoCompra extends ControladorFuncionesComunes {

    @RequestMapping(value="{idRestaurante}/{nombre}/home", method=RequestMethod.GET)
    public ModelAndView viewHomeRestaurante(@PathVariable int idRestaurante, @PathVariable String nombre, HttpServletRequest request ) {
        ModelAndView result = new ModelAndView("paginasClientes/homeRestaurante");
        cargaContenidoComun(request, result);
        
        Restaurante rest = gRestaurante.getRestaurante(idRestaurante);
        List<Producto> lcomida = gRestaurante.getProductos(idRestaurante, Constantes.TIPO_PRODUCTO_COMIDA);
        List<Producto> lbebida = gRestaurante.getProductos(idRestaurante, Constantes.TIPO_PRODUCTO_BEBIDA);
        List<Producto> lpostre = gRestaurante.getProductos(idRestaurante, Constantes.TIPO_PRODUCTO_POSTRE);
            
        result.addObject("comidas", lcomida);
        result.addObject("bebidas", lbebida);
        result.addObject("postres", lpostre);
        result.addObject("rest", rest);
        return result;
    } 
    
    @RequestMapping(value="{idRestaurante}/{nombre}/disponibilidad-mesas", method=RequestMethod.GET)
    public ModelAndView disponibilidadMesas( @PathVariable int idRestaurante, @PathVariable String nombre, HttpServletRequest request ) {
        ModelAndView result = new ModelAndView("paginasClientes/añadirCarrito");
        cargaContenidoComun(request, result);
        List<Mesa> lmesas = gMesas.getMesas(idRestaurante);
        result.addObject("lmesas", lmesas);
        return result;
    } 
    
    @RequestMapping(value="{idRestaurante}/{nombre}/platos", method=RequestMethod.GET)
    public ModelAndView listadoPlatos( @PathVariable int idRestaurante, @PathVariable String nombre, HttpServletRequest request ) {
        ModelAndView result = new ModelAndView("paginasClientes/añadirCarrito");
        cargaContenidoComun(request, result);
        List<Producto> lcomida = gRestaurante.getProductos(idRestaurante, Constantes.TIPO_PRODUCTO_COMIDA);
        List<Producto> lbebida = gRestaurante.getProductos(idRestaurante, Constantes.TIPO_PRODUCTO_BEBIDA);
        List<Producto> lpostre = gRestaurante.getProductos(idRestaurante, Constantes.TIPO_PRODUCTO_POSTRE);

        result.addObject("lcomida", lcomida);
        result.addObject("lbebida", lbebida);
        result.addObject("lpostre", lpostre);
        result.addObject("idRestaurante", idRestaurante);
        return result;
    } 
    
    @ResponseBody
    @RequestMapping(value="{idRestaurante}/carrito/add", method=RequestMethod.POST)
    public String addCarrito( @PathVariable int idRestaurante, HttpServletRequest request ) {
        ModelAndView result = new ModelAndView("paginasClientes/añadirCarrito");
        cargaContenidoComun(request, result);
        String response = "nok";
        String productos = getParametroString("productos", request);
        String aproductos[] = productos.split(",");
        int unidades = 0;
        int idMesa = getParametroInt("idMesa", request);
        
        List<Producto> lproductos = new ArrayList<>();
        Producto p = null;
        
        for (String idProducto : aproductos) {
            unidades = getParametroInt("inputUnidades"+idProducto, request);
            p = gRestaurante.getProducto(Integer.parseInt(idProducto));
            p.setUnidades(unidades);
            lproductos.add(p);
        }
        carrito.setLproductos(lproductos);
        carrito.setMesa(gMesas.getMesa(idMesa, idRestaurante));
        response = "ok";
        return response;
    } 
    
    @RequestMapping(value="{idRestaurante}/carrito", method=RequestMethod.GET)
    public ModelAndView viewCarrito( @PathVariable int idRestaurante, HttpServletRequest request ) {
        ModelAndView result = new ModelAndView("paginasClientes/carrito");
        cargaContenidoComun(request, result);
        result.addObject("carrito", carrito);
        result.addObject("idRestaurante", idRestaurante);
        return result;
    } 
    
    @ResponseBody
    @RequestMapping(value="{idRestaurante}/carrito/delete", method=RequestMethod.POST)
    public String deleteProductCarrito( @PathVariable int idRestaurante, HttpServletRequest request ) {
        ModelAndView result = new ModelAndView("paginasClientes/carrito");
        cargaContenidoComun(request, result);
        String response = "nok";
        int idProducto = getParametroInt("producto", request);
        for(int i = 0; i < carrito.getLproductos().size(); i++) {
            if(carrito.getLproductos().get(i).getIdProducto() == idProducto) {
                carrito.getLproductos().remove(i);
                response = "ok";
            }
        }
        return response;
    }

}
