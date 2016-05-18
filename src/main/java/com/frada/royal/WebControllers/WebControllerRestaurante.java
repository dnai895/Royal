/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.frada.royal.WebControllers;

import com.frada.royal.Entidades.Int_String;
import com.frada.royal.Entidades.Mesa;
import com.frada.royal.Entidades.Producto;
import com.frada.royal.Entidades.Restaurante;
import com.frada.royal.Utilidades.Constantes;
import com.frada.royal.Utilidades.General;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Dani
 */
@Controller
@RequestMapping("/restaurante/*")
public class WebControllerRestaurante extends ControladorFuncionesComunes {

    @RequestMapping(value = "datos", method = RequestMethod.GET)
    public ModelAndView viewData(HttpServletRequest request) {
        ModelAndView result = new ModelAndView("paginasRestaurante/datosRestaurante");
        cargaContenidoComun(request, result);
        if (!restaurante.isLogado()) {
            muestraPaginaError(result);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "datos", method = RequestMethod.POST)
    public String serviceData(HttpServletRequest request) {
        ModelAndView result = new ModelAndView("paginasRestaurante/datosRestaurante");
        cargaContenidoComun(request, result);

        String respuesta = "ok";
        if (restaurante.isLogado()) {
            String nombre = getParametroString("nombre", request);
            String direccion = getParametroString("direccion", request);
            String telefono = getParametroString("telefono", request);
            String email = getParametroString("email", request);
            String username = getParametroString("username", request);
            String web = getParametroString("web", request);
            String password = getParametroString("password", request);
            String cfpassword = getParametroString("cfpassword", request);
            int aforo = getParametroInt("aforo", request);

            restaurante.setNombre(nombre);
            restaurante.setDireccion(direccion);
            restaurante.setTelefono(telefono);
            restaurante.setUsername(username);
            restaurante.setWeb(web);
            restaurante.setEmail(email);
            restaurante.setPassword(password);
            restaurante.setCfpassword(cfpassword);
            restaurante.setAforo(aforo);

            gUsuarios.modificaUsuario(restaurante);

            if (restaurante.getPassword() != null && restaurante.getCfpassword() != null
                    && !restaurante.getPassword().isEmpty() && !restaurante.getCfpassword().isEmpty()
                    && !gUsuarios.checkDataUsuario(restaurante)) {
                respuesta = "kopasswd";
            }
        }

        return respuesta;
    }

    @RequestMapping(value = "datos-busqueda", method = RequestMethod.GET)
    public ModelAndView viewDataBusqueda(HttpServletRequest request) {
        ModelAndView result = new ModelAndView("paginasRestaurante/datosBusquedaRestaurante");
        cargaContenidoComun(request, result);
        result.addObject("restaurante", restaurante);
        if (!restaurante.isLogado()) {
            muestraPaginaError(result);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "datos-busqueda", method = RequestMethod.POST)
    public String serviceDataBusqueda(HttpServletRequest request) {
        ModelAndView result = new ModelAndView("paginasRestaurante/datosBusquedaRestaurante");
        cargaContenidoComun(request, result);
        String respuesta = "nok";
        if (restaurante.isLogado()) {
            String descripcion = getParametroString("descripcion", request);
            String intro = getParametroString("intro", request);
            String latitud = getParametroString("latitud", request);
            String longitud = getParametroString("longitud", request);
            restaurante.setDescripcion(descripcion);
            restaurante.setIntro(intro);
            restaurante.setLongitud(longitud);
            restaurante.setLatitud(latitud);
            try {
                gArchivos.guardaArchivos(request, restaurante.getIdRestaurante());
            } catch (Exception e) {
                General.log("WebControllerRestaurante", "ERROR al serviceDataBusqueda: " + e.getMessage());
            }

            gRestaurante.setDatosBusqueda(restaurante);
            respuesta = "ok";
        } else {
            muestraPaginaError(result);
        }
        return respuesta;
    }

    @RequestMapping(value = "home", method = RequestMethod.GET)
    public ModelAndView home(HttpServletRequest request) {
        ModelAndView result = new ModelAndView("paginasRestaurante/home");
        cargaContenidoComun(request, result);
        if (!restaurante.isLogado()) {
            muestraPaginaError(result);
        }
        return result;
    }

    @RequestMapping(value = "platos", method = RequestMethod.GET)
    public ModelAndView listadoPlatos(HttpServletRequest request) {
        ModelAndView result = new ModelAndView("paginasRestaurante/listadoPlatos");
        cargaContenidoComun(request, result);
        General.log("WebControllerRestaurante", "Restaurante " + restaurante.getUsername() + " (" + restaurante.getIdRestaurante() + ") logado: " + restaurante.isLogado());
        if (restaurante.isLogado()) {
            List<Producto> lcomida = gRestaurante.getProductos(restaurante.getIdRestaurante(), Constantes.TIPO_PRODUCTO_COMIDA);
            List<Producto> lbebida = gRestaurante.getProductos(restaurante.getIdRestaurante(), Constantes.TIPO_PRODUCTO_BEBIDA);
            List<Producto> lpostre = gRestaurante.getProductos(restaurante.getIdRestaurante(), Constantes.TIPO_PRODUCTO_POSTRE);

            result.addObject("lcomida", lcomida);
            result.addObject("lbebida", lbebida);
            result.addObject("lpostre", lpostre);
        } else {
            muestraPaginaError(result);
        }
        return result;
    }

    @RequestMapping(value = "plato", method = RequestMethod.GET)
    public ModelAndView viewPlato(HttpServletRequest request) {
        ModelAndView result = new ModelAndView("paginasRestaurante/viewPlato");
        cargaContenidoComun(request, result);

        if (restaurante.isLogado()) {
            List<Int_String> ltiposProducto = gRestaurante.getTipoProductos();
            result.addObject("ltiposProducto", ltiposProducto);
            result.addObject("action", 1);
        } else {
            muestraPaginaError(result);
        }
        return result;
    }

    @RequestMapping(value = "{idPlato}/plato", method = RequestMethod.GET)
    public ModelAndView editPlato(@PathVariable int idPlato, HttpServletRequest request) {
        ModelAndView result = new ModelAndView("paginasRestaurante/viewPlato");
        cargaContenidoComun(request, result);
        if (restaurante.isLogado()) {
            List<Int_String> ltiposProducto = gRestaurante.getTipoProductos();
            Producto producto = gRestaurante.getProducto(idPlato);
            result.addObject("producto", producto);
            result.addObject("ltiposProducto", ltiposProducto);
            result.addObject("action", 2);
        } else {
            muestraPaginaError(result);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "{idPlato}/plato", method = RequestMethod.POST)
    public String servicePlato(@PathVariable int idPlato, HttpServletRequest request) {
        ModelAndView result = new ModelAndView("paginasRestaurante/viewPlato");
        cargaContenidoComun(request, result);

        if (restaurante.isLogado()) {
            int action = getParametroInt("action", request);
            switch (action) {
                case Constantes.ACTION_INSERTAR:
                    Producto p1 = getParametersProducto(request);
                    gRestaurante.insertaProducto(p1);
                    break;
                case Constantes.ACTION_MODIFICAR:
                    Producto p2 = getParametersProducto(request);
                    p2.setIdProducto(idPlato);
                    gRestaurante.modificaProducto(p2);
                    break;
                case Constantes.ACTION_ELIMINAR:
                    gRestaurante.escondeProducto(idPlato, restaurante.getIdRestaurante());
                    break;
            }
        } else {
            muestraPaginaError(result);
        }

        return "ok";
    }

    @RequestMapping(value = "mesas", method = RequestMethod.GET)
    public ModelAndView listadoMesas(HttpServletRequest request) {
        ModelAndView result = new ModelAndView("paginasRestaurante/listadoMesas");
        cargaContenidoComun(request, result);
        General.log("WebControllerRestaurante", "logado: " + restaurante.isLogado());
        if (restaurante.isLogado()) {
            List<Mesa> lmesas = gMesas.getMesas(restaurante.getIdRestaurante());
            result.addObject("lmesas", lmesas);
        } else {
            muestraPaginaError(result);
        }
        return result;
    }

    @RequestMapping(value = "mesa", method = RequestMethod.GET)
    public ModelAndView viewMesa(HttpServletRequest request) {
        ModelAndView result = new ModelAndView("paginasRestaurante/viewMesa");
        cargaContenidoComun(request, result);

        if (restaurante.isLogado()) {
            result.addObject("action", 1);
        } else {
            muestraPaginaError(result);
        }
        return result;
    }

    @RequestMapping(value = "{idMesa}/mesa", method = RequestMethod.GET)
    public ModelAndView editMesa(@PathVariable int idMesa, HttpServletRequest request) {
        ModelAndView result = new ModelAndView("paginasRestaurante/viewMesa");
        cargaContenidoComun(request, result);
        if (restaurante.isLogado()) {
            Mesa mesa = gMesas.getMesa(idMesa, restaurante.getIdRestaurante());
            result.addObject("mesa", mesa);
            result.addObject("action", 2);
        } else {
            muestraPaginaError(result);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "{idMesa}/mesa", method = RequestMethod.POST)
    public String serviceMesa(@PathVariable int idMesa, HttpServletRequest request) {
        ModelAndView result = new ModelAndView("paginasRestaurante/viewPlato");
        cargaContenidoComun(request, result);

        if (restaurante.isLogado()) {
            int action = getParametroInt("action", request);
            switch (action) {
                case Constantes.ACTION_INSERTAR:
                    Mesa m1 = new Mesa();
                    m1.setIdRestaurante(restaurante.getIdRestaurante());
                    m1.setNumero(getParametroInt("numeroMesa", request));
                    m1.setSillas(getParametroInt("sillas", request));
                    gMesas.insertaMesa(m1);
                    break;
                case Constantes.ACTION_MODIFICAR:
                    Mesa m2 = new Mesa();
                    m2.setIdMesa(idMesa);
                    m2.setIdRestaurante(restaurante.getIdRestaurante());
                    m2.setNumero(getParametroInt("numeroMesa", request));
                    m2.setSillas(getParametroInt("sillas", request));
                    gMesas.modificaMesa(m2);
                    break;
                case Constantes.ACTION_ELIMINAR:
                    gMesas.escondeMesa(idMesa, restaurante.getIdRestaurante());
                    break;
            }
        } else {
            muestraPaginaError(result);
        }

        return "ok";
    }

    public Producto getParametersProducto(HttpServletRequest request) {
        Producto p = new Producto();
        p.setIdProducto(getParametroInt("idProducto", request));
        p.setNombre(getParametroString("nombre", request));
        p.setIdTipoProducto(getParametroInt("tipoProducto", request));
        p.setPrecio(getParametroDouble("precio", request));
        p.setDescripcion(getParametroString("descripcion", request));
        p.setIdRestaurante(restaurante.getIdRestaurante());
        return p;
    }

}
