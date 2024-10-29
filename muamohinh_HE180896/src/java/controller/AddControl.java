/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.account;

public class AddControl extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pname = request.getParameter("name");
        String pimage = request.getParameter("image");
        String price = request.getParameter("price");
        double pprice = Double.parseDouble(price);
        String ptitle = request.getParameter("title");
        String pdescription = request.getParameter("description");
        String category = request.getParameter("cateID");
        int pcategory = Integer.parseInt(category);
        String pbrand = request.getParameter("brand");
        String pscale = request.getParameter("scale");
        String stock = request.getParameter("stock");
        int pstock = Integer.parseInt(stock);

        ProductDAO dao = new ProductDAO();
        dao.insertProduct(pname, pbrand, pscale, pprice, 0, pdescription, pimage, ptitle, pcategory);
        response.sendRedirect("manager");
    }   

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
