/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import ClaseDAO.ProveedorDAO;
import Clases.Proveedor;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class RegistrarProveedor extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Proveedor prove = new Proveedor();
            ProveedorDAO provedao = new ProveedorDAO();
            String NIT1 = request.getParameter("NIT");
            String NIT2 = request.getParameter("NIT2");
            String NIT = NIT1 + "-" + NIT2;
            prove.setNIT(NIT);
            prove.setNombreEmpresa(request.getParameter("nombree"));
            prove.setNombreVendedor(request.getParameter("nombrev"));
            prove.setCorreo(request.getParameter("correo"));
            prove.setCelular(request.getParameter("celular"));
            prove.setDireccion(request.getParameter("direccion"));
            String Categoria = request.getParameter("categoira");
            String CategoriaSting[] = Categoria.split(";");
            CategoriaSting[0] = "0";
            ArrayList<Integer> CategoriaInt = new ArrayList<Integer>();;   
            int i = 0;
            for (Object o : CategoriaSting) {
                int a = Integer.parseInt(CategoriaSting[i]);               
                CategoriaInt.add(a);
                i++;
            }
            prove.setCategoria(CategoriaInt);
            out.print(provedao.RegistrarProveedor(prove));
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
