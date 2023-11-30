/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;
import java.util.*;
import com.google.gson.*;
@ServerEndpoint("/chat")
public class ProcessMessages extends HttpServlet {
    private static Set<Session> userSessions = new HashSet<Session>();
    
    @OnOpen 
    public void onOpen(Session session){
        userSessions.add(session);
        System.out.println("User Connected: " + session.getId());
    } 
    @OnClose
    public void onClose(Session session){
        userSessions.remove(session);
        System.out.println("User disconnected!");
    }
    @OnMessage
    public void onMessage(String message, Session session) throws IOException{
        
        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(message, JsonObject.class);
        if (jsonObject != null){
            String nameShown = jsonObject.get("nameShown").getAsString();
            String messageContent = jsonObject.get("messageContent").getAsString();
            String receiver = jsonObject.get("receiver").getAsString();
            System.out.println(nameShown);           
            for (Session ses : userSessions){
                ses.getAsyncRemote().sendText(nameShown+": "+ messageContent);
            }
        }
        
    }
}
