package com.servlet;

import com.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet(name = "transfer", urlPatterns = "/transfer")
// 对前端的增删改操作的响应
public class transfer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String type = request.getParameter("type"); // 获取前端请求的操作类型
            switch (type) {
                case "post": // 如果是修改岗位
                case "department": // 或者是修改部门
                    String tableKey = type.substring(0, 1) + "_id"; // 对应表的主码
                    int id = Integer.valueOf(request.getParameter("s_id")); // 获取欲修改的员工的id
                    if (General.exist("staff", "s_id", id)) { // 查看此员工是否存在
                        String staff_name = request.getParameter("s_name");
                        if (staff_name.equals(General.query("staff", "s_id", id, "s_name"))) { // 查看员工名字是否相符
                            int aimId = Integer.valueOf(request.getParameter(tableKey)); // 前端请求的修改的部门\岗位id
                            int oldId = (int) General.query("staff", "s_id", id, tableKey); // 查看此员工当前在哪个部门\岗位
                            if (aimId != oldId) { // 判断是否更改的部门和历史部门相同
                                boolean flag = General.update("staff", "s_id", id, tableKey, aimId); // 更改结果
                                if (flag) { // 如果更改成功
//                                System.out.println("Yes");
                                    String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date()); // 获取当前时间
                                    if (type.equals("post")) Transfer.insert(id, 0, aimId, date); // 如果只是修改岗位
                                    else { // 如果是修改部门，则还需要修改部门中的人数
                                        Transfer.insert(id, aimId, 0, date); // 插入至修改记录中
                                        // 原部门的人数减一，现有部门的人数加一
                                        General.update(type, "d_id", oldId, "d_num_people", (int) General.query(type, "d_id", oldId, "d_num_people") - 1);
                                        General.update(type, "d_id", aimId, "d_num_people", (int) General.query(type, "d_id", aimId, "d_num_people") + 1);
                                    }
//                                response.getWriter().println("<script>alert(\"Success\");</script>");
                                    request.setAttribute("result", "修改成功");
                                } else request.setAttribute("result", "修改失败");
                            } else request.setAttribute("result", "修改内容不能和历史相同");
                        } else request.setAttribute("result", "员工名字不符");
                    } else request.setAttribute("result", "员工不存在");
                    request.setAttribute("url", type + "Transfer.jsp"); // 定义返回的url
                    break;
                case "employeeEntry": { // 新增员工
                    // 从前端获取的信息
                    String name = request.getParameter("name");
                    int d_id = Integer.valueOf(request.getParameter("d_id"));
                    int p_id = Integer.valueOf(request.getParameter("p_id"));
                    int s_id = General.getId("staff");
                    boolean flag = Staff.insert(name, d_id, p_id); // 插入员工
                    if (flag) { // 如果插入成功
                        request.setAttribute("result", "添加成功"); // 回写信息
                        // 对应部门的人数加一
                        General.update("department", "d_id", d_id, "d_num_people", (int) General.query("department", "d_id", d_id, "d_num_people") + 1);
                        String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date()); // 获取当前的日期
                        Transfer.insert(s_id, d_id, p_id, date); // 增加至部门修改历史
                    } else request.setAttribute("result", "添加失败"); // 添加失败
                    request.setAttribute("url", "employeeEntry.jsp"); // 设置返回地址
                    break;
                }
                case "resign": { // 员工离职
                    int s_id = Integer.valueOf(request.getParameter("s_id")); // 前端写入的员工id
                    int repeat = Integer.valueOf(request.getParameter("repeat")); // 前端重复的员工id
                    String s_name = request.getParameter("s_name"); // 前端的员工姓名
                    if (repeat != s_id) {
                        if (General.exist("staff", "s_id", s_id)) { // 如果这个员工编号存在
                            if (s_name.equals(General.query("staff", "s_id", s_id, "s_name"))) { // 如果信息匹配
                                String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date()); // 当前日期
                                Transfer.insert(s_id, 0, 0, date); // 插入至修改历史
                                int d_id = (int) General.query("staff", "s_id", s_id, "d_id"); // 获取员工所在的部门
                                // 将员工所在部门的人数减一
                                General.update("department", "d_id", d_id, "d_num_people", (int) General.query("department", "d_id", d_id, "d_num_people") - 1);
                                // 将员工的所在部门和岗位置为0
                                Staff.update(s_id, s_name, 0, 0);
                                // 将离职信息插入至数据库
                                Resigned.insert(s_id, date);
                                request.setAttribute("result", "操作成功"); // 操作成功
                            } else request.setAttribute("result", "信息不匹配"); // 填入的员工姓名和数据库中的姓名不符
                        } else request.setAttribute("result", "员工编号不存在"); // 员工编号不存在
                    } else request.setAttribute("result", "两次填入的员工编号不同"); // 两次填入的编号不一样
                    request.setAttribute("url", "employeeResign.jsp");
                    break;
                }
                case "departmentAdd": { // 添加部门
                    String d_name = request.getParameter("d_name"); // 前端填入的部门名称
                    String d_phone = request.getParameter("d_phone"); // 部门的电话
                    String d_superior = request.getParameter("d_superior"); // 上级部门
                    boolean flag = Department.insert(d_name, d_phone, 0, d_superior); // 添加并存储保存结果
                    if (flag) request.setAttribute("result", "添加成功"); // 添加成功
                    else request.setAttribute("result", "添加失败"); // 添加失败
                    request.setAttribute("url", "departmentTransfer.jsp"); // 设置返回url
                    break;
                }
                case "postAdd": { // 添加岗位
                    String p_name = request.getParameter("p_name"); // 获取前端的岗位名称
                    boolean flag = Post.insert(p_name); // 插入岗位并获取结果
                    if (flag) request.setAttribute("result", "添加成功");
                    else request.setAttribute("result", "添加失败");
                    request.setAttribute("url", "postTransfer.jsp");
                    break;
                }
            }
            request.getRequestDispatcher("editResult.jsp").forward(request, response); // 回写结果页面
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
