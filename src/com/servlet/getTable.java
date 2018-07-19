package com.servlet;

import com.util.General;
import com.sql.SqlEditor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.Arrays;
import java.util.Objects;

@WebServlet(name = "getTable", urlPatterns = "/table")
// 相应前端对数据表的请求
public class getTable extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            SqlEditor sqlEditor = new SqlEditor();
            String tableName = request.getParameter("name"); // 请求的表名
            String page = request.getParameter("page"); // 请求的表的第$page页
            request.setAttribute("page", Objects.requireNonNullElse(page, "1")); // 如果这个变量为空，则置为1
            if (tableName.equalsIgnoreCase("post")) { // 表名
                request.setAttribute("data", General.listAll("post")); // 回写表的数据
                request.getRequestDispatcher("/post.jsp").forward(request, response); // 回显页面
            } else if (tableName.equalsIgnoreCase("department")) {
                request.setAttribute("data", General.listAll("department"));
                request.getRequestDispatcher("/department.jsp").forward(request, response);
            } else if (tableName.equalsIgnoreCase("employee")) {
                ResultSet resultSet = sqlEditor.query("SELECT `staff`.`s_id` AS `s_id`, `s_name`, `d_name`, `p_name` FROM `staff`, `department`, `post` WHERE (`staff`.`d_id` <> 0 AND `staff`.`p_id` <> 0 AND `staff`.`d_id` = `department`.`d_id` AND `staff`.`p_id` = `post`.`p_id`)", null);
                request.setAttribute("data", resultSet);
                request.getRequestDispatcher("/employee.jsp").forward(request, response);
            } else if (tableName.equalsIgnoreCase("career")) {
                ResultSet resultSet = sqlEditor.query(
                        "select `staff`.s_id as s_id, s_name, c_company, c_hiredate, c_leavedate from staff, career where staff.s_id = career.s_id", null);
                request.setAttribute("data", resultSet);
                request.getRequestDispatcher("/career.jsp").forward(request, response);
            } else if (tableName.equalsIgnoreCase("foreign")) {
                request.setAttribute("data", General.listAll("foreign"));
                request.getRequestDispatcher("/foreign.jsp").forward(request, response);
            } else if (tableName.equalsIgnoreCase("family")) {
                request.setAttribute("data", General.listAll("family"));
                request.getRequestDispatcher("/family.jsp").forward(request, response);
            } else if (tableName.equalsIgnoreCase("resigned")) {
                request.setAttribute("data", General.listAll("resigned"));
                request.getRequestDispatcher("/resigned.jsp").forward(request, response);
//            } else if (tableName.equalsIgnoreCase("dtransfer")) {
//                request.setAttribute("data", General.listAll("dtransfer"));
//                request.getRequestDispatcher("/postchange.jsp").forward(request, response);
            }
            else if (tableName.equalsIgnoreCase("employeeNew")) {
                ResultSet resultSet = sqlEditor.query("SELECT LAST_DAY(DATE_SUB(NOW(),INTERVAL 1 MONTH)) AS `date`", null);
                if (resultSet.next()) {
                    String lastDayOfLastMonth = resultSet.getDate("date").toString();
                    String sql = "SELECT * FROM ( SELECT `staff`.`s_id` AS `s_id`, `s_name`, `d_name`, `p_name`, `p_hiredate` FROM `staff`, `post`, `department`, `transfer` WHERE (`transfer`.`d_id` <> 0 AND `transfer`.`p_id` <> 0 AND `staff`.`d_id` = `department`.`d_id` AND `staff`.`p_id` = `post`.`p_id` AND `staff`.`s_id` = `transfer`.`s_id`) ) `tmp` WHERE `p_hiredate` > ? ORDER BY `p_hiredate` DESC";
                    resultSet = sqlEditor.query(sql, Arrays.asList(lastDayOfLastMonth));
                    request.setAttribute("data", resultSet);
                } else request.setAttribute("data", null);
                request.getRequestDispatcher("/employeeNew.jsp").forward(request, response);
            }
            else if (tableName.equalsIgnoreCase("employeeResignList")) {
                String sql = "SELECT `staff`.`s_id` AS `s_id`, `s_name`, `d_name`, `p_name`, `r_leavedate` FROM `staff`, `post`, `department`, `resigned` WHERE (`staff`.`d_id` = `department`.`d_id` AND `staff`.`p_id` = `post`.`p_id` AND `staff`.`s_id` = `resigned`.`s_id`) ORDER BY `r_leavedate` DESC";
                request.setAttribute("data", sqlEditor.query(sql, null));
                request.getRequestDispatcher("/employeeResignList.jsp").forward(request, response);
            }
            else if (tableName.equalsIgnoreCase("departmentTransList")) {
//                String sql = "SELECT DISTINCT `staff`.`s_id` AS `s_id`, `s_name`, `d_name` FROM `staff`, `department`, `transfer` WHERE `transfer`.`d_id` = `department`.`d_id` AND `staff`.`s_id` = `transfer`.`s_id`";
                String sql = "SELECT `staff`.`s_id` AS `s_id`, `s_name`, `d_name`, `p_hiredate` FROM `staff`, `department`, `transfer` WHERE (`transfer`.`d_id` <> 0 AND `transfer`.`d_id` = `department`.`d_id` AND `staff`.`s_id` = `transfer`.`s_id`) ORDER BY `p_hiredate` DESC";
                request.setAttribute("data", sqlEditor.query(sql, null));
                request.getRequestDispatcher("/departmentTransList.jsp").forward(request, response);
            }
            else if (tableName.equalsIgnoreCase("postTransList")) {
                String sql = "SELECT `staff`.`s_id` AS `s_id`, `s_name`, `p_name`, `p_hiredate` FROM `staff`, `post`, `transfer` WHERE (`transfer`.`p_id` <> 0 AND `transfer`.`p_id` = `post`.`p_id` AND `staff`.`s_id` = `transfer`.`s_id`) ORDER BY `p_hiredate` DESC";
                request.setAttribute("data", sqlEditor.query(sql, null));
                request.getRequestDispatcher("/postTransList.jsp").forward(request, response);
            }
            else if (tableName.equalsIgnoreCase("employeeDetail")) {
                request.setAttribute("s_id", Integer.valueOf(request.getParameter("s_id")));
                request.getRequestDispatcher("/employeeDetail.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
