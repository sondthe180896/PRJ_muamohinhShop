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
import model.Product;
import model.Wishlist;

/**
 *
 * @author hihihihaha
 */
public class WishListServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet WishListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WishListServlet at " + request.getContextPath() + "</h1>");
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
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        productDAO = new ProductDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Wishlist wishlist = (Wishlist) session.getAttribute("wishlist");

        if (wishlist == null) {
            wishlist = new Wishlist();
            session.setAttribute("wishlist", wishlist);
        }

        String action = request.getParameter("action");
        if ("add".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            Product product = productDAO.getProductById(productId);
            if (product != null) {
                wishlist.addProduct(product);
            }
        }

        request.setAttribute("wishlistItems", wishlist.getProducts());
        request.getRequestDispatcher("/wishlist.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int productId = Integer.parseInt(request.getParameter("productId"));

        HttpSession session = request.getSession();
        Wishlist wishlist = (Wishlist) session.getAttribute("wishlist");

        if (wishlist == null) {
            wishlist = new Wishlist();
            session.setAttribute("wishlist", wishlist);
        }

        if ("add".equals(action)) {
            Product product = productDAO.getProductById(productId);
            if (product != null) {
                wishlist.addProduct(product);
            }
        } else if ("remove".equals(action)) {
            wishlist.removeProduct(productId);
        }

        response.sendRedirect(request.getContextPath() + "/wishlist");
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
