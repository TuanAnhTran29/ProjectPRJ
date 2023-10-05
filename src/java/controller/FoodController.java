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
import model.Food;
import model.Order;
import model.Order_Food;
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
@WebServlet(name = "FoodController", urlPatterns = {"/FoodController"})
public class FoodController extends HttpServlet {

    private DAOCart daoCart = new DAOCart();
    private DAOFood daoFood = new DAOFood();
    private DAOUser daoUser = new DAOUser();
    private DAOStock daoStock = new DAOStock();
    private DAOOrder daoOrder = new DAOOrder();
    private DAOOrder_Food daoOrderFood = new DAOOrder_Food();

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
            out.println("<title>Servlet FoodController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FoodController at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "search":
                searchFoodByName(request, response);
                break;
            case "viewByCate":
                showFoodByCate(request, response);
                break;
            case "myFood":
                showMyFood(request, response);
                break;
            case "searchMyFood":
                searchFromMyFood(request, response);
                break;
            case "viewByCateByUser":
                showMyFoodByCate(request, response);
                break;
            case "addFood":
                showAddFoodForm(request, response);
                break;
            case "viewDetailMyFood":
                showDetailFood(request, response);
                break;
            case "showEditForm":
                showEditForm(request, response);
                break;
            case "showDeleteFood":
                showDeleteFood(request, response);
                break;
            default:
                showFoodList(request, response);
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
        String action = request.getParameter("action");
        switch (action) {
            case "addNewFood":
                addNewFood(request, response);
                break;
            case "editFood":
                editFood(request, response);
                break;
            case "deleteFood":
                deleteFood(request, response);
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
    private void showFoodList(HttpServletRequest request, HttpServletResponse response) {
        Vector<Food> vector = daoFood.findAllFoodRemaining();
        String username = request.getParameter("username");

        request.setAttribute("foods", vector);
        request.setAttribute("user", daoUser.findByUsername(username));
        request.setAttribute("category", daoFood.findAllCategory());

        if (daoUser.findByUsername(username).getRole().getName().equals("ADMIN")) {
            getRequestDispatch(request, response, "admin/admin_home.jsp");
        } else {
            getRequestDispatch(request, response, "user/user_home.jsp");
        }
    }

    private void searchFoodByName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("search");

        if (name == null || name.equals("")) {
            showFoodList(request, response);
        } else {
            String username = request.getParameter("username");
            Vector<Food> vector = daoFood.findAllByName(name);
            if (vector == null || vector.isEmpty()) {
                request.setAttribute("message", "Cannot find this food!");

                showFoodList(request, response);
            } else {
                request.setAttribute("message", "Search results:");
                request.setAttribute("foods", vector);
                request.setAttribute("category", daoFood.findAllCategory());
                request.setAttribute("user", daoUser.findByUsername(username));

                getRequestDispatch(request, response, "user/user_home.jsp");
            }
        }

    }

    private void showFoodByCate(HttpServletRequest request, HttpServletResponse response) {
        String nameCate = request.getParameter("category");
        String username = request.getParameter("username");

        request.setAttribute("foods", daoFood.findAllByCategory(nameCate));
        request.setAttribute("user", daoUser.findByUsername(username));
        request.setAttribute("category", daoFood.findAllCategory());

        if (daoUser.findByUsername(username).getRole().getName().equals("ADMIN")) {
            getRequestDispatch(request, response, "admin/admin_home.jsp");
        } else {
            getRequestDispatch(request, response, "user/user_home.jsp");
        }

    }

    private void showMyFood(HttpServletRequest request, HttpServletResponse response) {
        int userID = Integer.parseInt(request.getParameter("cusID"));

        Vector<Food> vector = daoFood.findAllByUserID(userID);
        Vector<String> category = daoFood.findAllCateByUserID(userID);
        User user = daoUser.findByID(userID);

        request.setAttribute("foods", vector);
        request.setAttribute("category", category);
        request.setAttribute("user", user);

        getRequestDispatch(request, response, "admin/my_food.jsp");
    }

    private void showMyFoodByCate(HttpServletRequest request, HttpServletResponse response) {
        String nameCate = request.getParameter("category");
        String username = request.getParameter("username");
        User user = daoUser.findByUsername(username);
        Vector<Food> vector = daoFood.findAllFoodByCateByUserID(user.getUserID(), nameCate);

        request.setAttribute("foods", vector);
        request.setAttribute("user", user);
        request.setAttribute("category", daoFood.findAllCateByUserID(user.getUserID()));

        getRequestDispatch(request, response, "admin/my_food.jsp");
    }

    private void searchFromMyFood(HttpServletRequest request, HttpServletResponse response) {
        String search = request.getParameter("search");
        String username = request.getParameter("username");

        User user = daoUser.findByUsername(username);
        Vector<Food> vector = daoFood.findAllByUserID(user.getUserID());
        Vector<String> category = daoFood.findAllCateByUserID(user.getUserID());
        Vector<Food> searchResult = new Vector<>();

        for (Food f : vector) {
            if (f.getFoodName().equals(search)) {
                searchResult.add(f);
            }
        }

        request.setAttribute("foods", searchResult);
        request.setAttribute("user", user);
        request.setAttribute("category", category);

        getRequestDispatch(request, response, "admin/my_food.jsp");
    }

    private void showAddFoodForm(HttpServletRequest request, HttpServletResponse response) {
        int userID = Integer.parseInt(request.getParameter("cusID"));
        User user = daoUser.findByID(userID);

        request.setAttribute("user", user);
        if (daoFood.findAllFood().isEmpty()) {
            request.setAttribute("foodID", 1);
        } else {
            request.setAttribute("foodID", daoFood.findAllFood().get(daoFood.findAllFood().size() - 1).getFoodID() + 1);
        }
        getRequestDispatch(request, response, "food/add_food.jsp");
    }
    
    private void showDetailFood(HttpServletRequest request, HttpServletResponse response) {
        int cusID = Integer.parseInt(request.getParameter("cusID"));
        int foodID = Integer.parseInt(request.getParameter("foodID"));
        
        User user = daoUser.findByID(cusID);
        Food food = daoFood.findByID(foodID);

        request.setAttribute("user", user);
        request.setAttribute("food", food);
        request.setAttribute("stock", daoStock.findQuantityByFoodID(foodID));

        getRequestDispatch(request, response, "admin/view_food_detail.jsp");

    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int foodID = Integer.parseInt(request.getParameter("foodID"));
        int cusID = Integer.parseInt(request.getParameter("cusID"));

        Food food = daoFood.findByID(foodID);
        User user = daoUser.findByID(cusID);
        int quantity = daoStock.findQuantityByFoodID(foodID);

        request.setAttribute("quantity", quantity);
        request.setAttribute("food", food);
        request.setAttribute("user", user);

        getRequestDispatch(request, response, "food/edit_food.jsp");
    }

    private void showDeleteFood(HttpServletRequest request, HttpServletResponse response) {
        int foodID = Integer.parseInt(request.getParameter("foodID"));
        int cusID = Integer.parseInt(request.getParameter("cusID"));

        request.setAttribute("user", daoUser.findByID(cusID));
        request.setAttribute("food", daoFood.findByID(foodID));
        request.setAttribute("stock", daoStock.findQuantityByFoodID(foodID));

        getRequestDispatch(request, response, "food/delete_food.jsp");

    }

    //POST FUNCTION
    private void addNewFood(HttpServletRequest request, HttpServletResponse response) {
        int cusID = Integer.parseInt(request.getParameter("cusID"));

        User user = daoUser.findByID(cusID);
        Vector<Food> vector = daoFood.findAllByUserID(cusID);

        String foodID = request.getParameter("foodID");
        String foodName = request.getParameter("foodName");
        String category = request.getParameter("category");
        String quantity = request.getParameter("quantity");
        String brandName = request.getParameter("brand");
        String price = request.getParameter("price");
        String description = request.getParameter("description");

        if (foodName.equals("") || category.equals("") || brandName.equals("") || price.equals("") || quantity.equals("")) {
            request.setAttribute("user", daoUser.findByID(cusID));
            request.setAttribute("message", "Please fill out the form completely!");

        } else {

            boolean existed = false;
            int fID = Integer.parseInt(foodID);
            int fQuantity = Integer.parseInt(quantity);
            int fPrice = Integer.parseInt(price);

            for (Food f : vector) {
                if (f.getFoodName().equals(foodName) && f.getCategoryName().equals(category) && f.getBrandName().equals(brandName)) {
                    fID = f.getFoodID();
                    existed = true;
                    break;
                }
            }
//            System.out.println(daoFood.findAllFood().size());
            if (existed == true) {
                request.setAttribute("message", "Food existed!");
            } else {
                daoFood.insertNewFood(fID, foodName, category, brandName, fPrice, description);
                daoStock.insertNewStock(cusID, fID, fQuantity);

                request.setAttribute("message", "Inserted successfully!");

            }

            request.setAttribute("foodID", daoFood.findAllFood().get(daoFood.findAllFood().size() - 1).getFoodID() + 1);
            request.setAttribute("user", daoUser.findByID(cusID));

        }

        getRequestDispatch(request, response, "food/add_food.jsp");

    }

    private void editFood(HttpServletRequest request, HttpServletResponse response) {
        int cusID = Integer.parseInt(request.getParameter("cusID"));
        int foodID = Integer.parseInt(request.getParameter("foodID"));

        String category = request.getParameter("category");
        String brand = request.getParameter("brand");
        String description = request.getParameter("description");

        float price = Float.parseFloat(request.getParameter("price"));

        if (price <= 0) {
            request.setAttribute("message", "Price must be greater than 0!");
        } else {
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            if (quantity <= 0) {
                request.setAttribute("message", "Quantity must be greater than 0!");
            } else {
                daoFood.updateFood(category, brand, price, description, foodID);
                daoStock.updateStock(quantity, cusID, foodID);
                request.setAttribute("message", "Updated successfull!");
            }
        }
        request.setAttribute("food", daoFood.findByID(foodID));
        request.setAttribute("user", daoUser.findByID(cusID));
        request.setAttribute("quantity", daoStock.findQuantityByFoodID(foodID));

        getRequestDispatch(request, response, "food/edit_food.jsp");
    }

    private void deleteFood(HttpServletRequest request, HttpServletResponse response) {
        int foodID = Integer.parseInt(request.getParameter("foodID"));
        int cusID = Integer.parseInt(request.getParameter("cusID"));

        if (!daoOrderFood.findAllByFoodID(foodID).isEmpty()) {
            int orderID = daoOrderFood.findAllByFoodID(foodID).get(0).getOrderID();
            int size = daoOrderFood.findOrderDetail(orderID).size();

            daoOrderFood.deleteByFoodID(foodID);

            if (size <= 1) {
                daoOrder.deleteByOrderID(orderID);
            } else {
                float total = 0;
                for (Order_Food of : (Vector<Order_Food>) daoOrderFood.findOrderDetail(orderID)) {
                    total += of.getList_price() * of.getQuantity();
                }
                daoOrder.updateTotalPriceByOrderID(total, orderID);
            }
        }

        daoCart.deleteFromCart(foodID, cusID);
        daoStock.deleteStock(cusID, foodID);
        daoFood.deleteFood(foodID);

        Vector<Food> vector = daoFood.findAllByUserID(cusID);
        Vector<String> category = daoFood.findAllCateByUserID(cusID);
        User user = daoUser.findByID(cusID);

        request.setAttribute("foods", vector);
        request.setAttribute("category", category);
        request.setAttribute("user", user);

        request.setAttribute("message", "Deleted successfully!");

        getRequestDispatch(request, response, "admin/my_food.jsp");

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
    
    public Food findByID(int id){
        return daoFood.findByID(id);
    }

}
