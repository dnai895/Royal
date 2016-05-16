/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.frada.royal.Gestores;

import com.frada.royal.Utilidades.Constantes;
import com.frada.royal.Utilidades.General;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Dani
 */
@Component
public class GestorUploadFiles {

    public boolean guardaArchivos(HttpServletRequest request,int idRestaurante) {
        try {
            MultipartHttpServletRequest multirequest = (MultipartHttpServletRequest) request;
            Iterator<String> itr = multirequest.getFileNames();

            MultipartFile file;
            String fileName;

            while (itr.hasNext()) {
                fileName = itr.next();
                file = multirequest.getFile(fileName);
                
                String sruta = generaRuta(idRestaurante)+"/"+file.getOriginalFilename();
                General.log("GestorUploadFiles", "ruta: "+sruta);
                
                subirArchivos(sruta, file);
                /**
                 * AquÃ­ iria el codigo donde hariamos una query para guardar la
                 * referencia del archivo
                 */
            }

        } catch (Exception e) {
            General.log("GestorUploadFiles", "ERROR en obtener archivo: " + e.getMessage());
            e.printStackTrace();
        }

        return true;
    }

    public void subirArchivos(String urlArchivo, MultipartFile file) {
        try {
            // Url del directoria a guardar
            File archivo    = new File(urlArchivo);
            General.log("GestorUploadFiles", "  can execute: "+archivo.canExecute());
            General.log("GestorUploadFiles", "  file: "+archivo.getAbsoluteFile());
            General.log("GestorUploadFiles", "  path: "+archivo.getAbsolutePath());
            File directorio = new File(archivo.getParent());
            // Comprovamos que exista el directorio. Si no existe creamos el directorio si la url es correcta.
            if (!directorio.exists()) {
                General.log("GestorUploadFiles", "Creamos directorio");
                directorio.mkdirs();
            }
            byte[] bytes = file.getBytes();
//            File serverFile = new File(urlArchivo);
            FileOutputStream stream = new FileOutputStream(archivo);
            stream.write(bytes);
            stream.close();
        } catch (IOException ex) {
            General.log("GestorUploadFiles", "ERROR en subirArchivo: " + ex.getMessage());
//            ex.printStackTrace();
        }
    }
    
    public String generaRuta(int idRestaurante) {
        String ruta = Constantes.CONTEXTPATH+"/img/restaurantes/"+idRestaurante;
        return ruta;
    }
}
