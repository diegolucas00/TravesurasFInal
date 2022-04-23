/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import ClaseDAO.CompraDAO;
import Clases.Compra;
import Clases.CompraDetalle;
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
public class RegistrarFacturaCompra extends HttpServlet {

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
            CompraDAO comprardao = new CompraDAO();
            Compra compra = new Compra();
            CompraDetalle compradetalle = new CompraDetalle();
            
            compra.setValor_Total(Float.parseFloat(request.getParameter("TOTALT")));

            String datospid = request.getParameter("datospid");
            String datospidSting[] = datospid.split(";");
            ArrayList<Integer> datospidInt = new ArrayList<Integer>();;
            int i = 0;
            for (Object o : datospidSting) {
                int a = Integer.parseInt(datospidSting[i]);
                datospidInt.add(a);
                i++;
            }

            String datospcp = request.getParameter("datospcp");
            String datospcpPSting[] = datospcp.split(";");
            ArrayList<Integer> datospcpInt = new ArrayList<Integer>();;
            i = 0;
            for (Object o : datospcpPSting) {
                int a = Integer.parseInt(datospcpPSting[i]);
                datospcpInt.add(a);
                i++;
            }

            String datospvp = request.getParameter("datospvp");
            String datospvpSting[] = datospvp.split(";");
            ArrayList<Integer> datospvpPInt = new ArrayList<Integer>();;
            i = 0;
            for (Object o : datospvpSting) {
                int a = Integer.parseInt(datospvpSting[i]);
                datospvpPInt.add(a);
                i++;
            }

            String datospcu = request.getParameter("datospcu");
            String datospcuSting[] = datospcu.split(";");
            ArrayList<Integer> datospcuInt = new ArrayList<Integer>();;
            i = 0;
            for (Object o : datospcuSting) {
                int a = Integer.parseInt(datospcuSting[i]);
                datospcuInt.add(a);
                i++;
            }

            String datospvu = request.getParameter("datospvu");
            String datospvuSting[] = datospvu.split(";");
            ArrayList<Integer> datospvuInt = new ArrayList<Integer>();;
            i = 0;
            for (Object o : datospvuSting) {
                int a = Integer.parseInt(datospvuSting[i]);
                datospvuInt.add(a);
                i++;
            }      
            compradetalle.setProducto(datospidInt);
            compradetalle.setCantidadPaquete(datospcpInt);
            compradetalle.setValorPaquete(datospvpPInt);
            compradetalle.setCantidadUnidad(datospcuInt);
            compradetalle.setValorUnidad(datospvuInt);
            
            out.print(comprardao.RegistrarFactura(compra, compradetalle));
            
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
