/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this li
cense
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.UserDAO;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.nio.charset.StandardCharsets;
import model.User;
/**
 *
 * @author Tan
 */
public class ProcessRegister extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = mahoa(request.getParameter("password"));
        
        User user = new User();
        user.setName(name);
        user.setAddress(address);
        user.setPhone(phone);
        user.setEmail(email);
        user.setPassword(password);
        
        new UserDAO().addUser(user);
        
        String action = request.getParameter("action");
        if(action.equals("add")){
            response.sendRedirect("homeServlet");
        }
        else{
            request.getRequestDispatcher("/form-dky.html").forward(request, response);
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
        processRequest(request, response);
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