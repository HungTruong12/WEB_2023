/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.UserDAO;
import dao.productDAO;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Product;
import model.User;


/**
 *
 * @author 84961
 */
@WebServlet(name="admin", urlPatterns={"/admin"})
public class admin extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        UserDAO c = new UserDAO();
//        ArrayList<User> users = c.getUsers();
//        request.setAttribute("users", users);
//        
//        ArrayList<Product> products = new productDAO().getProduct();
//        request.setAttribute("products", products);
        String action = request.getParameter("action");
        if(action != null && action.equals("search_product")){
            try {
                String name = request.getParameter("name");
                ArrayList<Product> a = new productDAO().getProductByName(name);
                request.setAttribute("product", a);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        UserDAO c = new UserDAO();
        ArrayList<User> users = c.getUsers();
        request.setAttribute("users", users);
        
        ArrayList<Product> products = new productDAO().getProduct();
        request.setAttribute("product", products);
        
        HttpSession session = request.getSession();
        
        String action = request.getParameter("action");
        
        // Qu?n lý ngu?i dùng
        if(action != null && action.equals("manage_user")
            && session.getAttribute("role") != null && session.getAttribute("role").equals("admin")){

            session.setAttribute("displayProduct", "none");
            session.setAttribute("displayUser", "block");
            
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
            return;
        }
        
        // qu?n lý s?n ph?m
        
        if(action != null && action.equals("manage_product")
            && session.getAttribute("role") != null && session.getAttribute("role").equals("admin")){
            session.setAttribute("displayProduct", "block");
            session.setAttribute("displayUser", "none");
            
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
            return;
        }
        
        // xóa s?n ph?m
        if(action != null && action.equals("Delete")
            && session.getAttribute("role") != null && session.getAttribute("role").equals("admin")){
            
            String id = request.getParameter("id");
            new productDAO().deleteProduct(id);
            
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
            return;
        }
        
        // ch?nh s?a s?n ph?m
        if(action != null && action.equals("Edit")
            && session.getAttribute("role") != null && session.getAttribute("role").equals("admin")){
            
            String id = request.getParameter("id");
            Product a = new productDAO().selectProduct(id);
            request.setAttribute("product", a);
            request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
            return;
            
        }
        
        if(action != null && action.equals("search_product")){
            String name = request.getParameter("name");
            ArrayList<Product> a = new productDAO().getProductByName(name);
            request.setAttribute("product", a);
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
            return;
        }
        
        if(action != null && action.equals("search_user")){
            String name = request.getParameter("name");
            ArrayList<User> a = new UserDAO().getUserByName(name);
            request.setAttribute("users", a);
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
            return;
        }
        
        if(session.getAttribute("role") == null || !session.getAttribute("role").equals("admin")){
            response.sendRedirect(request.getContextPath() + "/");
        }
        
        else if(session.getAttribute("role").equals("admin")){
            session.setAttribute("displayProduct", "block");
            session.setAttribute("displayUser", "none");
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
        }
    }

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
