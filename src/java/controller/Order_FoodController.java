/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.Order_Food;
import model.User;
import service.DAOOrder;
import service.DAOOrder_Food;
import service.DAOUser;

/**
 *
 * @author tuana
 */
@WebServlet(name = "Order_FoodController", urlPatterns = {"/Order_FoodController"})
public class Order_FoodController extends HttpServlet {

    private DAOOrder_Food daoOrderFood = new DAOOrder_Food();
    private DAOUser daoUser = new DAOUser();
    private DAOOrder daoOrder = new DAOOrder();

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Order_FoodController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Order_FoodController at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);

        String action = request.getParameter("action");
        if (action == null) {
            action = "viewOrderDetail";
        }

        switch (action) {
            case "viewAcceptedOrderDetail":
                viewAcceptedOrderDetail(request, response);
                break;
            case "viewSubmittedOrderDetail":
                viewSubmittedOrderDetail(request, response);
                break;
            default:
                viewOrderDetail(request, response);
        }
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
//        processRequest(request, response);
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

    public int findQuantityFoodByOrderDate(String orderDate) {
        return daoOrderFood.findByOrderDate(orderDate).size();
    }

    private void viewOrderDetail(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        User user = daoUser.findByUsername(username);
        Vector<Order_Food> vector = daoOrderFood.findOrderDetail(orderID);
        double totalPrice = 0;
        User customer = daoUser.findByID(daoOrder.findByID(orderID).getUserID());

        for (Order_Food o : vector) {
            totalPrice += o.getList_price();
        }

        request.setAttribute("message", "");
        request.setAttribute("foodController", new FoodController());
        request.setAttribute("user", user);
        request.setAttribute("order", vector);
        request.setAttribute("orderID", orderID);
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("customer", customer);

        getRequestDispatch(request, response, "order/order_detail.jsp");
    }

    //SEND TO VIEW
    private void getRequestDispatch(HttpServletRequest request, HttpServletResponse response, String view) {
        RequestDispatcher rd = request.getRequestDispatcher(view);
        try {
            rd.forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void viewAcceptedOrderDetail(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        User user = daoUser.findByUsername(username);
        Vector<Order_Food> vector = daoOrderFood.findOrderDetail(orderID);
        double totalPrice = 0;
        User customer = daoUser.findByID(daoOrder.findByID(orderID).getUserID());

        for (Order_Food o : vector) {
            totalPrice += o.getList_price();
        }

        request.setAttribute("message", "");
        request.setAttribute("foodController", new FoodController());
        request.setAttribute("user", user);
        request.setAttribute("order", vector);
        request.setAttribute("orderID", orderID);
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("customer", customer);

        getRequestDispatch(request, response, "order/order_accepted_detail.jsp");
    }

    private void viewSubmittedOrderDetail(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        User user = daoUser.findByUsername(username);
        Vector<Order_Food> vector = daoOrderFood.findOrderDetail(orderID);
        double totalPrice = 0;
        User customer = daoUser.findByID(daoOrder.findByID(orderID).getUserID());

        for (Order_Food o : vector) {
            totalPrice += o.getList_price();
        }

        request.setAttribute("message", "");
        request.setAttribute("foodController", new FoodController());
        request.setAttribute("user", user);
        request.setAttribute("order", vector);
        request.setAttribute("orderID", orderID);
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("customer", customer);

        getRequestDispatch(request, response, "order/order_submitted_detail.jsp");
    }
}
