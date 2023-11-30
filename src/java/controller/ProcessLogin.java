/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

//import com.sun.tools.javac.jvm.Profile;
import dao.UserDAO;
import dao.cartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.jsp.PageContext;
import jakarta.websocket.Session;
import model.Order;
import sun.security.jgss.GSSUtil;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.nio.charset.StandardCharsets;
import model.Cart;
import model.CartItem;
import model.User;

/**
 *
 * @author Tan
 */
public class ProcessLogin extends HttpServlet {
    private User USER;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String user = request.getParameter("username");
        String adminpassword = request.getParameter("password");
        String db_username = getServletContext().getInitParameter("username");
        String db_password = getServletContext().getInitParameter("password");
        
        if(user.equalsIgnoreCase(db_username) && adminpassword.equalsIgnoreCase(db_password)){
            HttpSession session=request.getSession();
            session.setAttribute("role", "admin");
            session.setAttribute("loginFailShown", false);
            Cookie loginSuccessCookie = new Cookie("loginSuccess", "true");
            loginSuccessCookie.setMaxAge(30 * 60); // 30p
            response.addCookie(loginSuccessCookie);
            response.sendRedirect("admin");
            
        }
        else{
            USER = new User();
            USER.setEmail(user);
            USER.setPassword(mahoa(request.getParameter("password")));
            boolean bool = new UserDAO().login(USER);
            if(bool){
                HttpSession session=request.getSession();
                session.setAttribute("id", USER.getId());
                session.setAttribute("name", USER.getName());
                session.setAttribute("email", user);
                session.setAttribute("role", USER.getRole());
                session.setAttribute("tel", USER.getPhone());
                session.setAttribute("address", USER.getAddress()); 
                
                session.setAttribute("user", USER);
                    
                session.setAttribute("loginFailShown", false);
                Cookie loginSuccessCookie = new Cookie("loginSuccess", "true");
                loginSuccessCookie.setMaxAge(30 * 60); // 30p
                response.addCookie(loginSuccessCookie);
                
                if(USER.getRole().equals("user")){
//                    ArrayList<Order> orderList = new UserDAO().getAllOrder(user);
//                    session.setAttribute("orderlist", orderList);\
//                    Cart cart = new Cart();
//                    cart.setId(USER.getId());
//                    ArrayList<CartItem> cartList = new cartDAO().getAllCartItem(cart);
//                    request.getSession().setAttribute("cartList", cartList);
                    
                    request.getRequestDispatcher("text.jsp").forward(request, response);
                }
                else{
                    response.sendRedirect("admin");
                }
            }
            else {
                Cookie loginFailCookie = new Cookie("loginFail", "true");
                loginFailCookie.setMaxAge(60 * 60 * 24); // Thiết lập thời gian sống cho cookie 
                response.addCookie(loginFailCookie);
                request.setAttribute("loginFail", "fail");
                request.getRequestDispatcher("text.jsp").forward(request, response);
            }
        }
    }
    private String mahoa( String password){
        try {
            // Tạo một đối tượng MessageDigest với thuật toán SHA-1
            MessageDigest md = MessageDigest.getInstance("SHA-1");

            // Chuyển mật khẩu thành mảng byte
            byte[] bytes = password.getBytes(StandardCharsets.UTF_8);

            // Băm mật khẩu
            byte[] hashedBytes = md.digest(bytes);

            // Chuyển mảng byte sang chuỗi hex
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }

            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
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
        response.sendRedirect("text.jsp");
        
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
