package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.OrderDAO;
import dao.UserDAO;
import dao.cartDAO;
import dao.productDAO;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cart;
import model.CartItem;
import model.Order;
import model.Product;
import model.User;

/**
 *
 * @author Tan
 */
public class ProcessDatHang extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        int quantity = Integer.parseInt(request.getParameter("quantity"));
//        String email = (String) request.getSession().getAttribute("email");
//        String fullname = new UserDAO().getName(email);
        String id_Product = request.getParameter("idProduct");
        User user = (User) request.getSession().getAttribute("user");
        
        CartItem cartItem = new CartItem();
        cartItem.setQuantity(quantity);
        cartItem.setProduct(new productDAO().selectProduct(id_Product));
        new cartDAO().addCartItem(user.getId(), cartItem);
        
        Cart cart = new Cart();
        cart.setId(user.getId());
        ArrayList<CartItem> cartList = new cartDAO().getAllCartItem(cart);
        
        request.getSession().setAttribute("cartList", cartList);
//        for (Order x : orderList) {
//            
//        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        Cart cart = new Cart();
        cart.setId(1);
        ArrayList<CartItem> cartList = new cartDAO().getAllCartItem(cart);
        
//        request.getSession().setAttribute("cartList", cartList);
        
        request.getRequestDispatcher("Checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
