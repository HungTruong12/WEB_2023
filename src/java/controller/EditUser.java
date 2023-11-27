/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.User;

/**
 *
 * @author ADMIN
 */
public class EditUser extends HttpServlet {
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");
        if(action.equals("update")){
            HttpSession session = request.getSession();
            String email = request.getParameter("email_name");
            String name = request.getParameter("client_name");
            String phone = request.getParameter("tel");
            String address = request.getParameter("address_name");
            
            session.setAttribute("email", email);
            session.setAttribute("name", name);
            session.setAttribute("tel", phone);
            session.setAttribute("address", address);
            
            User user = new User();
            user.setName(name);
            user.setPhone(phone);
            user.setAddress(address);
            
            boolean bool = new UserDAO().UpdateUser(user);
            response.sendRedirect(request.getContextPath() + "/");
        }
        
        else if (action.equals("Delete")){
            String email = request.getParameter("email");
            new UserDAO().deleteUser(email);
            request.getRequestDispatcher("/admin").forward(request, response);
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

}
