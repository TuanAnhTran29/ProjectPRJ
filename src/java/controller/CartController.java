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
import model.Cart;
import model.Food;
import model.Order;
import model.User;
import service.DAOCart;
import service.DAOFood;
import service.DAOOrder;
import service.DAOOrder_Food;
import service.DAOStock;
import service.DAOUser;

/**
 *
 * @author tuana
 */
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {
    private DAOFood daoFood= new DAOFood();
    private DAOUser daoUser= new DAOUser();
    private DAOCart daoCart= new DAOCart();
    private DAOStock daoStock= new DAOStock();
    private DAOOrder daoOrder= new DAOOrder();
    private DAOOrder_Food daoOrderFood= new DAOOrder_Food();
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
            out.println("<title>Servlet CartController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartController at " + request.getContextPath() + "</h1>");
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
        String action= request.getParameter("action");
        if (action== null) {
            action= "viewCart";
        }
        switch (action) {
            case "addToCart":
                showFoodToAdd(request,response);
                break;
            default:
                showUserCart(request,response);
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
        String action= request.getParameter("action");
        switch (action) {
            case "addedToCart":
                addFoodToCart(request,response);
                break;
            case "addOrder":
                addOrder(request,response);
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

    
    //GET FUNCTIONS
    private void showFoodToAdd(HttpServletRequest request, HttpServletResponse response) {
        int foodID= Integer.parseInt(request.getParameter("foodID"));
        String username= request.getParameter("username");
        
        Food food= daoFood.findByID(foodID);
        User user= daoUser.findByUsername(username);
        
        request.setAttribute("food", food);
        request.setAttribute("user", user);
        
        getRequestDispatch(request, response, "cart/add_to_cart.jsp");
    }
    
    
    private void showUserCart(HttpServletRequest request, HttpServletResponse response){
        int cusID= Integer.parseInt(request.getParameter("cusID"));
        Vector<Food> foods= new Vector<>();
        Vector<Cart> carts= daoCart.findByUserID(cusID);
        User user= daoUser.findByID(cusID);
        double total= 0;
        
        for(Cart c: carts){
            foods.add(daoFood.findByID(c.getFoodID()));
            total+= c.getQuantity() * daoFood.findByID(c.getFoodID()).getPrice();
        }       
        
        request.setAttribute("user", user);
        request.setAttribute("carts", carts);
        request.setAttribute("foods", foods);
        request.setAttribute("total", total);
        request.setAttribute("cartController", new CartController());
        
        getRequestDispatch(request, response, "user/user_cart.jsp");
    }
    
    

    
    
    

    
    //POST FUNCTIONS
    private void addFoodToCart(HttpServletRequest request, HttpServletResponse response) {
        String quantity= request.getParameter("quantity");
        int foodID= Integer.parseInt(request.getParameter("foodID"));
        int userID= Integer.parseInt(request.getParameter("userID"));
        
        if (quantity== null || quantity.equals("") || Integer.parseInt(quantity)<=0 ) {
            request.setAttribute("message", "Quantity must be more than 0!");
            request.setAttribute("food", daoFood.findByID(foodID));
            request.setAttribute("user", daoUser.findByID(userID));
            
            getRequestDispatch(request, response, "cart/add_to_cart.jsp");
        }else if (Integer.parseInt(quantity) > daoStock.findQuantityByFoodID(foodID)) {
            request.setAttribute("message", "Quantity required is more than quantity in stock");
            request.setAttribute("food", daoFood.findByID(foodID));
            request.setAttribute("user", daoUser.findByID(userID));
            getRequestDispatch(request, response, "cart/add_to_cart.jsp");
        }else{
            Cart cart= daoCart.findByFoodIDAndUserID(userID,foodID);
            if (cart!= null) {
                int newQuantity= cart.getQuantity() + Integer.parseInt(quantity);
                daoCart.updateQuantity(newQuantity, foodID,userID);
            }else{
                daoCart.addToCart(userID, foodID, Integer.parseInt(quantity));
            }
            request.setAttribute("user", daoUser.findByID(userID));
            request.setAttribute("foods", daoFood.findAllFoodRemaining());
            request.setAttribute("category", daoFood.findAllCategory());
            request.setAttribute("message", "Added " +daoFood.findByID(foodID).getFoodName() + " to cart success!");
            
            if (daoUser.findByID(userID).getRole().getName().equals("ADMIN")) {
                getRequestDispatch(request, response, "admin/admin_home.jsp");
            }else{
                getRequestDispatch(request, response, "user/user_home.jsp");
            }
            
        }
        
    }
    
    
    private void addOrder(HttpServletRequest request, HttpServletResponse response) {
        String name= request.getParameter("update");
        int cusID= Integer.parseInt(request.getParameter("cusID"));
        String[] fIDs= request.getParameterValues("foodID");
        String[] quantities= request.getParameterValues("quantity");
        String[] checkbox= request.getParameterValues("checkboxFoodID");
        
        int i= 0;
        
        //UPDATE QUANTITY IN CART
        for (String s : fIDs) {
            daoCart.updateQuantity(Integer.parseInt(quantities[i]), Integer.parseInt(s), cusID);
            i++;
        }
        
        
        
        if (checkbox == null || checkbox.length == 0) {
            request.setAttribute("message", "Please check the box you want to buy or delete!");
            showUserCart(request, response);
            
        }else if (name.equals("update")) {
            request.setAttribute("message", "Cart updated!");
            showUserCart(request, response);

        } else if (name.equals("buy")) {
            boolean isAccepted= true;
            for (String s : checkbox) {
                if (daoStock.findQuantityByFoodID(Integer.parseInt(s)) < getQuantityByFoodIDAndUserID(Integer.parseInt(s), cusID)) {
                    isAccepted= false;
                    break;
                }
            }
            
            if (isAccepted== false) {
                for (String s : checkbox) {
                    if (daoStock.findQuantityByFoodID(Integer.parseInt(s)) < getQuantityByFoodIDAndUserID(Integer.parseInt(s), cusID)) {
                        request.setAttribute("message", "Quantity of " + daoFood.findByID(Integer.parseInt(s)).getFoodName() + " is more than stock!");
                        break;
                    }
                }
                showUserCart(request, response);
            }else{
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
                LocalDateTime orderDate = LocalDateTime.now(); 
                
                daoOrder.createOrder(cusID, "UNDONE", dtf.format(orderDate));
                Order order = daoOrder.findOrderByOrderDate(dtf.format(orderDate));
                
                double price= 0;
                double totalPrice= 0;
                
                for (String s : checkbox) {
                    
                    totalPrice+= daoFood.findByID(Integer.parseInt(s)).getPrice() * daoCart.findByFoodIDAndUserID(cusID, Integer.parseInt(s)).getQuantity();
                    
                    price = daoFood.findByID(Integer.parseInt(s)).getPrice() * daoCart.findByFoodIDAndUserID(cusID, Integer.parseInt(s)).getQuantity();

                    daoOrderFood.insertOrderFood(order.getOrderID(), Integer.parseInt(s), getQuantityByFoodIDAndUserID(Integer.parseInt(s), cusID), price);
                    
//                    daoStock.setQuantityAfterAddOrder((-getQuantityByFoodIDAndUserID(Integer.parseInt(s), cusID)), Integer.parseInt(s));

                    daoCart.deleteFromCart(Integer.parseInt(s), cusID);

                }
                
                daoOrder.updateTotalPrice(totalPrice, dtf.format(orderDate));
                
                request.setAttribute("user", daoUser.findByID(cusID));
                request.setAttribute("order", daoOrderFood.findByOrderDate(dtf.format(orderDate)));
                request.setAttribute("orderID", order.getOrderID());
                request.setAttribute("foodController", new FoodController());
                request.setAttribute("totalPrice", totalPrice);               
                request.setAttribute("message", "Ordered successfully!");
                
                getRequestDispatch(request, response, "order/order_detail.jsp");
            }

        } else {
            daoCart.deleteFromCart(Integer.parseInt(name), cusID);
            request.setAttribute("message", "Deleted " + daoFood.findByID(Integer.parseInt(name)).getFoodName() + " successfully!");
            showUserCart(request, response);
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
    
    
    public int getQuantityByFoodIDAndUserID(int foodID,int userID){
        Cart cart= daoCart.findByFoodIDAndUserID(userID,foodID);
        return cart.getQuantity();
    }

    

    

}
