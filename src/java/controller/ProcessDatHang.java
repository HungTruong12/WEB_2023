/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.OrderDAO;
import dao.UserDAO;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;

/**
 *
 * @author Tan
 */
public class ProcessDatHang extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String paymentMethod = request.getParameter("paymentMethod");
        String tenSanPham = request.getParameter("tenSanPham");
        int giaTien = Integer.parseInt(request.getParameter("giaTien"));
        String email = (String) request.getSession().getAttribute("email");
//        String fullname = new UserDAO().getName(email);
        String fullname = (String) request.getSession().getAttribute("name");
        int tongtien = quantity*giaTien;
        
        if (paymentMethod.equals("directly")) paymentMethod = "Thanh toán khi nhận hàng";
        else paymentMethod = "Banking";
        Order order = new Order();
        new OrderDAO().addOrder(order);
        ArrayList<Order> orderList = new UserDAO().getAllOrder(email);
        
        request.getSession().setAttribute("orderlist", orderList);
//        for (Order x : orderList) {
//            
//        }
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
