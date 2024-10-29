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
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import model.Product;
import model.account;

/**
 *
 * @author hihihihaha
 */
public class ManagerControl extends HttpServlet {

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
            out.println("<title>Servlet ManagerControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        account account = (account) session.getAttribute("account");
        
        if (account != null) {
            // Kiểm tra xem tài khoản có quyền admin hay không (nếu cần)
            if (account.getRole() == 1) { // Giả sử role 1 là cho admin
                ProductDAO dao = new ProductDAO();
                List<Product> list = dao.getAllProducts();
                request.setAttribute("listP", list);
                request.getRequestDispatcher("manager.jsp").forward(request, response);
            } else {
                response.sendRedirect("login.jsp"); // Chuyển hướng đến trang từ chối truy cập cho người dùng không phải admin
            }
        } else {
            response.sendRedirect("login.jsp"); // Chuyển hướng đến trang đăng nhập nếu không có tài khoản trong session
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
