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
public class addCartItem extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String id_Product = request.getParameter("idProduct");
        User user = (User) request.getSession().getAttribute("user");
        
        Cart cart = new Cart();
        cart.setId(user.getId());
        
        CartItem cartItem = new CartItem();
        cartItem.setQuantity(quantity);
        cartItem.setProduct(new productDAO().selectProduct(id_Product));
        
        ArrayList<CartItem> cartList = new cartDAO().getAllCartItem(cart);
        int ok = 0;
        for(CartItem x: cartList){
            if(x.getProduct().getId().equals(id_Product)){
                new cartDAO().UpdateCartItem(x.getId(), quantity + x.getQuantity());
                ok = 1;
                break;
            }
        }
        
        if(ok == 0) new cartDAO().addCartItem(user.getId(), cartItem);
        
        cartList = new cartDAO().getAllCartItem(cart);
        request.getSession().setAttribute("cartList", cartList);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idCartItem = Integer.parseInt(request.getParameter("id"));
//        int quantity = Integer.parseInt(request.getParameter("quantity"));
//        String quantity = request.getParameter("quantity");
//        new cartDAO().UpdateCartItem(idCartItem, quantity);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
