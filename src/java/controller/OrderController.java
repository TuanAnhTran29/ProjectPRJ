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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.Order_Food;
import model.Servant;
import model.User;
import service.DAOOrder;
import service.DAOOrder_Food;
import service.DAOServant;
import service.DAOStock;
import service.DAOUser;

/**
 *
 * @author tuana
 */
@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})
public class OrderController extends HttpServlet {
    private DAOUser daoUser= new DAOUser();
    private DAOOrder daoOrder= new DAOOrder();
    private DAOOrder_Food daoOrderFood= new DAOOrder_Food();
    private DAOStock daoStock= new DAOStock();
    private DAOServant daoServant= new DAOServant();
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
            out.println("<title>Servlet OrderController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderController at " + request.getContextPath() + "</h1>");
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

        String action= request.getParameter("action");
        if (action== null) {
            action= "";
        }
        
        switch (action) {
            case "viewOrder":
                viewOrderHistory(request, response);
                break;
            case "acceptOrder":
                acceptOrder(request, response);
                break;
            case "viewAcceptedOrder":
                viewAcceptedOrder(request, response);
                break;
            case "viewSubmittedOrder":
                viewSubmittedOrder(request,response);
                break;
            case "viewUserAcceptedOrder":
                viewUserAcceptedOrder(request,response);
                break;
            case "viewUserServedOrder":
                viewUserServedOrder(request,response);
                break;
            
            
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

        String action= request.getParameter("action");
        switch (action) {
            case "submitOrder":
                submitOrder(request,response);
                break;
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

    
    private void viewOrderHistory(HttpServletRequest request, HttpServletResponse response) {
        int cusID= Integer.parseInt(request.getParameter("cusID"));
        
        User user= daoUser.findByID(cusID);

        if (user.getRole().getName().equals("ADMIN")) {
            Vector<Order> vector = daoOrder.findAllUserOrder();

            request.setAttribute("orders", vector);
            request.setAttribute("user", user);
            request.setAttribute("order_food", new Order_FoodController());
            getRequestDispatch(request, response, "order/my_order_list.jsp");
        }else{
            Vector<Order> vector = daoOrder.findAllOrderByUserID(cusID);
            request.setAttribute("orderFoodController", new Order_FoodController());
            request.setAttribute("user", user);
            request.setAttribute("orders", vector);
            getRequestDispatch(request, response, "order/order_history.jsp");
        }
        
    }
    
    
    //SEND TO VIEW
    private void getRequestDispatch(HttpServletRequest request, HttpServletResponse response, String view){
        RequestDispatcher rd= request.getRequestDispatcher(view);
        try {
            rd.forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void acceptOrder(HttpServletRequest request, HttpServletResponse response) {
        int cusID= Integer.parseInt(request.getParameter("cusID"));
        User user= daoUser.findByID(cusID);
        Servant servant= daoServant.findByEmail(user.getEmail());
        
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        Order order = daoOrder.findByID(orderID);

        Vector<Order_Food> orderFood = daoOrderFood.findOrderDetail(orderID);

        for (Order_Food of : orderFood) {
            daoStock.setQuantityAfterOrder((-of.getQuantity()), of.getFoodID());
        }

        String status = "In progress...";

        daoOrder.serveOrder(status, servant.getServantID(), orderID);
        
        Vector<Order> vector = daoOrder.findAllUserOrder();

        request.setAttribute("orders", vector);
        request.setAttribute("user", user);
        request.setAttribute("order_food", new Order_FoodController());
        
        request.setAttribute("message", "Accepted order with order id= " + orderID);
        
        getRequestDispatch(request, response, "order/my_order_list.jsp");
    }

    private void viewAcceptedOrder(HttpServletRequest request, HttpServletResponse response) {
        int cusID= Integer.parseInt(request.getParameter("cusID"));
        
        User user= daoUser.findByID(cusID);
        Servant servant= daoServant.findByEmail(user.getEmail());
        
        Vector<Order> vector = daoOrder.findAllOrderAccepted(servant.getServantID());

        request.setAttribute("orders", vector);
        request.setAttribute("user", user);
        request.setAttribute("order_food", new Order_FoodController());
        getRequestDispatch(request, response, "order/order_accepted.jsp");
    }

    private void submitOrder(HttpServletRequest request, HttpServletResponse response) {
        int cusID= Integer.parseInt(request.getParameter("cusID"));
        int orderID= Integer.parseInt(request.getParameter("orderID"));
        
        User user= daoUser.findByID(cusID);
        Servant servant= daoServant.findByEmail(user.getEmail());
        
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime serveDate = LocalDateTime.now();
        
        daoOrder.submitOrder(dtf.format(serveDate),orderID);
        
        
        Vector<Order> vector = daoOrder.findAllOrderAccepted(servant.getServantID());

        request.setAttribute("orders", vector);
        request.setAttribute("user", user);
        request.setAttribute("order_food", new Order_FoodController());
        getRequestDispatch(request, response, "order/order_accepted.jsp");
    }

    private void viewSubmittedOrder(HttpServletRequest request, HttpServletResponse response) {
        int cusID= Integer.parseInt(request.getParameter("cusID"));
        
        User user= daoUser.findByID(cusID);
        Servant servant= daoServant.findByEmail(user.getEmail());
        
        Vector<Order> vector = daoOrder.findAllOrderSubmitted(servant.getServantID());

        request.setAttribute("orders", vector);
        request.setAttribute("user", user);
        request.setAttribute("order_food", new Order_FoodController());
        getRequestDispatch(request, response, "order/order_submitted.jsp");
    }

    private void viewUserAcceptedOrder(HttpServletRequest request, HttpServletResponse response) {
        int cusID= Integer.parseInt(request.getParameter("cusID"));
        
        User user = daoUser.findByID(cusID);

        Vector<Order> vector = daoOrder.getAllUserAcceptedOrder(cusID);
        request.setAttribute("orderFoodController", new Order_FoodController());
        request.setAttribute("user", user);
        request.setAttribute("orders", vector);
        getRequestDispatch(request, response, "order/user_accepted_order.jsp");
    }

    private void viewUserServedOrder(HttpServletRequest request, HttpServletResponse response) {
        int cusID= Integer.parseInt(request.getParameter("cusID"));
        
        User user = daoUser.findByID(cusID);

        Vector<Order> vector = daoOrder.getAllUserServedOrder(cusID);
        request.setAttribute("orderFoodController", new Order_FoodController());
        request.setAttribute("user", user);
        request.setAttribute("orders", vector);
        getRequestDispatch(request, response, "order/user_served_order.jsp");
    }

    

    
}
