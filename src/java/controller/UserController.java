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
import java.util.Base64;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Food;
import model.Role;
import model.Servant;
import model.User;
import service.DAOFood;
import service.DAORole;
import service.DAOServant;
import service.DAOStock;
import service.DAOUser;

/**
 *
 * @author tuana
 */
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    private DAOUser daoUser = new DAOUser();
    private DAORole daoRole = new DAORole();
    private DAOFood daoFood = new DAOFood();
    private DAOStock dAOStock = new DAOStock();
    private DAOServant daoServant = new DAOServant();

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
            case "forgetPassword":
                showForgetPasswordForm(request, response);
                break;
            case "createAccount":
                showCreateAccountForm(request, response);
                break;
            case "viewProfile":
                showMyProfile(request, response);
                break;
            case "showEditProfile":
                showEditProfile(request, response);
                break;
            default:
                showLoginForm(request, response);
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
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "loginAccount":
                loginAccount(request, response);
                break;
            case "forgetPassword":
                forgetPassword(request, response);
                break;
            case "createAccount":
                createAccount(request, response);
                break;
            case "editProfile":
                editProfile(request, response);
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

    //MAIN FUNCTIONS
    //GET FUNCTIONS
    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) {
        getRequestDispatch(request, response, "/account/login.jsp");
    }

    private void showForgetPasswordForm(HttpServletRequest request, HttpServletResponse response) {
        getRequestDispatch(request, response, "/account/forget_password.jsp");
    }

    private void showCreateAccountForm(HttpServletRequest request, HttpServletResponse response) {
        getRequestDispatch(request, response, "/account/create_account.jsp");
    }

    private void showMyProfile(HttpServletRequest request, HttpServletResponse response) {
        int userID = Integer.parseInt(request.getParameter("cusID"));
        User user = daoUser.findByID(userID);

        request.setAttribute("user", user);
        getRequestDispatch(request, response, "user/my_profile.jsp");
    }

    private void showEditProfile(HttpServletRequest request, HttpServletResponse response) {
        int userID = Integer.parseInt(request.getParameter("cusID"));
        User user = daoUser.findByID(userID);

        request.setAttribute("user", user);
        getRequestDispatch(request, response, "user/edit_profile.jsp");
    }

    //END GET FUNCTIONS
    //POST FUNCTIONS
    private void loginAccount(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = daoUser.loginUser(username, Base64.getEncoder().encodeToString(password.getBytes()));
        if (user == null) {
            request.setAttribute("message", "Username or password wrong! Try again");
            request.setAttribute("username", username);

            getRequestDispatch(request, response, "/account/login.jsp");
        } else {
            request.setAttribute("user", user);
            request.setAttribute("foods", daoFood.findAllFoodRemaining());
            request.setAttribute("category", daoFood.findAllCategory());

            if (user.getRole().getName().equals("ADMIN")) {
                getRequestDispatch(request, response, "admin/admin_home.jsp");
            } else {
                getRequestDispatch(request, response, "user/user_home.jsp");
            }
        }
    }

    private void forgetPassword(HttpServletRequest request, HttpServletResponse response) {
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirmPassword");
        if (!password.equals(confirm)) {
            request.setAttribute("message", "Password and confirm password must be matched!");
            getRequestDispatch(request, response, "/account/forget_password.jsp");
        } else {
            String username = request.getParameter("username");
            User user = daoUser.findByUsername(username);
            if (user != null) {
                byte[] encrypt = password.getBytes();
                daoUser.changePasswordForUser(username, Base64.getEncoder().encodeToString(encrypt));
                request.setAttribute("message", "Your password was updated!");
                request.setAttribute("username", username);
                getRequestDispatch(request, response, "/account/login.jsp");
            } else {
                request.setAttribute("message", "Can not find this user!");
                getRequestDispatch(request, response, "/account/forget_password.jsp");
            }
        }
    }

    private void createAccount(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        if (daoUser.findByUsername(username) != null) {
            request.setAttribute("message", "User existed!");
            getRequestDispatch(request, response, "/account/create_account.jsp");
        } else {
            String email = request.getParameter("email");
            if (!email.matches("^[a-z][a-z0-9_]{5,32}@[a-z0-9]{2,}(\\.[a-z0-9]{2,4}){1,2}$")) {
                request.setAttribute("message", "Wrong email format!");
                getRequestDispatch(request, response, "/account/create_account.jsp");
            } else {
                if (daoUser.findByEmail(email) != null) {
                    request.setAttribute("message", "Email used!");
                    getRequestDispatch(request, response, "/account/create_account.jsp");
                } else {
                    String phone = request.getParameter("phone");
                    if (!phone.matches("(84|0[3|5|7|8|9])+([0-9]{8})")) {
                        request.setAttribute("message", "Wrong phone format!");
                        getRequestDispatch(request, response, "/account/create_account.jsp");
                    } else {
                        if (daoUser.findByPhone(phone) != null) {
                            request.setAttribute("message", "Phone used!");
                            getRequestDispatch(request, response, "/account/create_account.jsp");
                        } else {
                            String password = request.getParameter("password");
                            String confirm = request.getParameter("confirmPassword");
                            if (!password.equals(confirm)) {
                                request.setAttribute("message", "Password and confirm password must be matched!");
                                getRequestDispatch(request, response, "/account/create_account.jsp");
                            } else if (!password.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$")) {
                                request.setAttribute("message", "Password must be longer than 8 characters and contain ai least uppercase, lowercase and number");
                                getRequestDispatch(request, response, "/account/create_account.jsp");
                            } else {
                                String roleID = request.getParameter("role");
                                if (roleID == null) {
                                    request.setAttribute("message", "Please select your role!");
                                    getRequestDispatch(request, response, "/account/create_account.jsp");
                                } else {
                                    Role role = daoRole.findByID(Integer.parseInt(request.getParameter("role")));
                                    String firstName = request.getParameter("firstName");
                                    String lastName = request.getParameter("lastName");
                                    String address = request.getParameter("address");

                                    byte[] encrypt = password.getBytes();

                                    User user = new User(firstName, lastName, email, phone, username, Base64.getEncoder().encodeToString(encrypt), address, role);
                                    daoUser.createUser(user);

                                    Vector<Food> vector = daoFood.findAllFoodRemaining();

                                    request.setAttribute("foods", vector);
                                    request.setAttribute("user", daoUser.findByUsername(username));
                                    request.setAttribute("category", daoFood.findAllCategory());
                                    
                                    
                                    
                                    if (role.getRoleID() == 1) {
                                        daoServant.createServant(new Servant(firstName, lastName, email, phone, username, password, address));
                                        getRequestDispatch(request, response, "/admin/admin_home.jsp");
                                    }else{
                                        getRequestDispatch(request, response, "/user/user_home.jsp");
                                    }

                                    request.setAttribute("message", "Sign up successfully!");

                                    
                                }
                            }
                        }

                    }

                }
            }

        }
    }

    private void editProfile(HttpServletRequest request, HttpServletResponse response) {
        int userID = Integer.parseInt(request.getParameter("cusID"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String address = request.getParameter("address");

        if (firstName.equals("") || lastName.equals("") || username.equals("") || address.equals("")) {
            request.setAttribute("message", "Please fill out the form completely!");
            request.setAttribute("user", daoUser.findByID(userID));
        } else {
            Vector<User> vector = daoUser.findAllUser();
            boolean exist = false;
            for (User u : vector) {
                if (u.getUsername().equals(username) && u.getUserID() != userID) {
                    exist = true;
                }
            }
            if (exist) {
                request.setAttribute("message", "Existed username! Try again");
                request.setAttribute("user", daoUser.findByID(userID));
            } else {
                daoUser.updateUser(firstName, lastName, username, address, userID);
                request.setAttribute("message", "Updated information successfully!");
                request.setAttribute("user", daoUser.findByID(userID));
            }

        }
        getRequestDispatch(request, response, "user/edit_profile.jsp");
    }

    //END POST FUNCTIONS
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
}
