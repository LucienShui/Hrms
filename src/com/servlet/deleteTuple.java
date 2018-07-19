package com.servlet;

import com.util.General;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "deleteTuple", urlPatterns = "/delete")
public class deleteTuple extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tableName = request.getParameter("tn");
        String primaryKey = request.getParameter("pk");
        int id = Integer.valueOf(request.getParameter("id"));
        General.delete(tableName, primaryKey, id);
        General.Stack.push(tableName, id);
        request.getRequestDispatcher("table?name=" + tableName).forward(request, response);
    }
}
