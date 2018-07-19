package com.servlet;

import com.sql.SqlEditor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.Arrays;

@WebServlet(name = "loginVerification", urlPatterns = "/loginVerification")
public class loginVerification extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        SqlEditor sqlEditor = new SqlEditor();
        ResultSet resultSet = sqlEditor.query( "select `password` from `users` where `username` = ?", Arrays.asList(username));
        boolean flag = false;
        try {
            if (resultSet.next()) {
                if (password != null && resultSet.getString("password").equals(password)) {
                    session.setAttribute("id", "Hello World!");
                    flag = true;
                    response.sendRedirect("/");
//                    request.getRequestDispatcher("/").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp");
        }
        if (!flag) {
            session.setAttribute("id", "");
            response.sendRedirect("login.jsp");
//            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("type").equals("logout")) {
            HttpSession session = request.getSession();
            session.setAttribute("id", null);
        }
        response.sendRedirect("/");
    }
}
