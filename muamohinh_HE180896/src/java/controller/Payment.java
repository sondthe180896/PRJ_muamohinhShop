/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import dal.PaymentInfoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import model.PaymentInfo;
import model.account;

/**
 *
 * @author hihihihaha
 */
public class Payment extends HttpServlet {

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
            out.println("<title>Servlet Payment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Payment at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        account account = (account) session.getAttribute("account");
        
        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String orderId = request.getParameter("orderId");
        if (orderId != null && !orderId.isEmpty()) {
            OrderDAO orderDAO = new OrderDAO();
            Order order = orderDAO.getOrderById(Integer.parseInt(orderId));
            if (order != null && "Pending".equals(order.getStatus()) && order.getUserId() == account.getId()) {
                request.setAttribute("order", order);
                request.getRequestDispatcher("payment.jsp").forward(request, response);
            } else {
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    HttpSession session = request.getSession();
    account account = (account) session.getAttribute("account");
    
    if (account == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String orderId = request.getParameter("orderId");
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");

    if (orderId != null && !orderId.isEmpty()) {
        OrderDAO orderDAO = new OrderDAO();
        Order order = orderDAO.getOrderById(Integer.parseInt(orderId));
        if (order != null && "Pending".equals(order.getStatus()) && order.getUserId() == account.getId()) {
            // Create PaymentInfo object
            PaymentInfo paymentInfo = new PaymentInfo(Integer.parseInt(orderId), name, address, phone);

            // Save PaymentInfo to database
            // You'll need to create a new DAO for PaymentInfo, let's call it PaymentInfoDAO
            PaymentInfoDAO paymentInfoDAO = new PaymentInfoDAO();
            paymentInfoDAO.savePaymentInfo(paymentInfo);

            // Process payment here
            order.setStatus("Paid");
            orderDAO.updateOrder(order);
            session.setAttribute("orderConfirmation", "Your order has been paid successfully. Order ID: " + orderId);
            response.sendRedirect("orderConfirm.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    } else {
        response.sendRedirect("error.jsp");
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
