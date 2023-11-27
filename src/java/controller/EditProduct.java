/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.productDAO;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Category;
import model.Product;

/**
 *
 * @author 84961
 */
@WebServlet(name="EditProduct", urlPatterns={"/EditProduct"})
public class EditProduct extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        String userRole = (String) session.getAttribute("role");
        
        if(action != null && action.equals("add_new_product")){
            if (userRole != null && userRole.equals("admin")) {
//                response.sendRedirect("add-new-product.jsp");
                request.getRequestDispatcher("/add-new-product.jsp").forward(request, response);
            } else {
                response.getWriter().write("403 Forbidden");
            }
        }
        
        // Ch?nh s?a thông tin s?n ph?m
        else if (action != null && action.equals("Edit_product")){
            
            if(userRole != null && userRole.equals("admin")){
                String id = request.getParameter("id");
                productDAO c = new productDAO();
                Product a = c.selectProduct(id);
                request.setAttribute("product", a);
                request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
            }
            else response.getWriter().write("403 Forbidden");
        }
        
        // Xóa s?n ph?m
        else if (action != null && action.equals("deleteProduct")){
            if(userRole != null && userRole.equals("admin")){
                String id = request.getParameter("id");
                new productDAO().deleteProduct(id);
                request.getRequestDispatcher("/admin").forward(request, response);
            }
            else response.getWriter().write("403 Forbidden");
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        int type = Integer.parseInt(request.getParameter("type"));
        String image = request.getParameter("image");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
                
        if(action.equals("add")){
            try{
                if(id != "" && name != "" && price != ""){
                    Product product =  new Product();
                    product.setId(id);
                    product.setCate(new CategoryDAO().getCategory(type));
                    product.setName(name);
                    product.setImage(image);
                    product.setQuantity(quantity);
                    product.setPrice(Integer.parseInt(price.replaceAll("\\.", "")));
                    
                    new productDAO().addProduct(product);
                    response.sendRedirect("admin");
                }
                else{
                    request.getRequestDispatcher("/add-new-product.jsp").forward(request, response);
                }
            }catch(NumberFormatException e){
                System.out.println(e);
            }
        }
        else if(action.equals("update_sp")){
            if(id != "" && name != "" && price != ""){
                    Product product =  new Product();
                    product.setId(id);
                    product.setCate(new CategoryDAO().getCategory(type));
                    product.setName(name);
                    product.setImage(image);
                    product.setQuantity(quantity);
                    product.setPrice(Integer.parseInt(price.replaceAll("\\.", "")));
                    new productDAO().updateProduct(product);
                    response.sendRedirect("admin");
            }
            else{
                request.getRequestDispatcher("/updateProduct.jsp").forward(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}