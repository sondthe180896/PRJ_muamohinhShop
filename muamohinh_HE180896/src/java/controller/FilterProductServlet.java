/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
public class FilterProductServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet FilterProductServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterProductServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId = request.getParameter("cid");
        String brand = request.getParameter("brand");
        String price1 = request.getParameter("price1");
        String price2 = request.getParameter("price2");

        // Ensure you handle null or empty values appropriately
        int minPrice = (price1 != null && !price1.isEmpty()) ? Integer.parseInt(price1) : Integer.MIN_VALUE;
        int maxPrice = (price2 != null && !price2.isEmpty()) ? Integer.parseInt(price2) : Integer.MAX_VALUE;

        // Call your DAO or service layer to get the filtered products
        ProductDAO productDAO = new ProductDAO();
        List<Product> filteredProducts = productDAO.getFilteredProducts(categoryId, brand, minPrice, maxPrice);
        
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> listC = categoryDAO.getAllCategories();

        request.setAttribute("listP", filteredProducts);
        request.setAttribute("listC", listC); // Đưa danh sách danh mục vào request

        request.setAttribute("brand", brand);
        
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
