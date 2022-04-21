/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import ClaseDAO.PedidoDAO;
import Clases.Pedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class RegistrarPedido extends HttpServlet {

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
            Pedido pedido = new Pedido();
            PedidoDAO pedidodao = new PedidoDAO();
            String id = request.getParameter("id");
            String idSting[] = id.split(";");
            ArrayList<Integer> idInt = new ArrayList<Integer>();;
            int i = 0;
            for (Object o : idSting) {
                int a = Integer.parseInt(idSting[i]);
                idInt.add(a);
                i++;
            }
            String cantidadp = request.getParameter("cantidadp");
            String cantidadpSting[] = cantidadp.split(";");
            ArrayList<Integer> cantidadpInt = new ArrayList<Integer>();;
            int m = 0;
            for (Object o : idSting) {
                int a = Integer.parseInt(cantidadpSting[m]);
                cantidadpInt.add(a);
                m++;
            }
            String cantidadun = request.getParameter("cantidadun");
            String cantidadunSting[] = cantidadun.split(";");
            ArrayList<Integer> cantidadunInt = new ArrayList<Integer>();;
            int r = 0;
            for (Object o : cantidadunSting) {
                int a = Integer.parseInt(cantidadunSting[r]);
                cantidadunInt.add(a);
                r++;
            }
            pedido.setIdProducto(idInt);
            pedido.setCantidadPauqete(cantidadpInt);
            pedido.setCantidadUnidad(cantidadunInt);
            pedido.setIdProveedor(Integer.parseInt(request.getParameter("idprovee")));
            
            out.print(pedidodao.RegistrarProducto(pedido));
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
