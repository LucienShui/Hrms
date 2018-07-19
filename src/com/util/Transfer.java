package com.util;

import com.sql.SqlEditor;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Transfer {
    private static String tableName = "transfer"; // 表名
    private static String primaryKey = "t_id"; // 主码名称

    /**
     * 插入
     * @param s_id 员工编号
     * @param d_id 部门编号
     * @param p_id 岗位编号
     * @param p_hiredate 入职日期
     * @return 插入是否成功，成功返回true，失败返回false
     * @throws SQLException 数据库操作错误
     */
    public static boolean insert(int s_id, int d_id, int p_id, String p_hiredate) throws SQLException {
        SqlEditor sql = new SqlEditor(); // 数据库编辑器对象
        List<List<Object>> datas = new ArrayList<>(); // 传入的datas二维数组
        datas.add(Arrays.asList(General.getId(tableName), s_id, d_id, p_id, p_hiredate)); // 将参数插入datas
        // 执行插入，并将返回结果保存至flag中
        boolean flag = sql.update("insert into " + tableName + " values (?, ?, ?, ?, ?)", datas) != 0;
        if (flag) General.idUpdate(tableName); // 如果插入成功，则将这张表的最小可用id增加1
        return flag; // 返回操作是否成功
    }

    /**
     * 更新调动信息
     * @param t_id 调动编号
     * @param s_id 员工编号
     * @param d_id 部门编号
     * @param p_id 岗位编号
     * @param p_hiredate 入职日期
     * @return 影响的行数
     */
    public static int update(int t_id, int s_id, int d_id, int p_id, String p_hiredate) {
        SqlEditor sql = new SqlEditor(); // 数据库编辑器对象
        List<List<Object>> datas = new ArrayList<>(); // 传入的datas二维数组
        datas.add(Arrays.asList(s_id, d_id, p_id, p_hiredate, t_id)); // 将参数插入datas
        // 执行更新操作，并返回影响的行数
        return sql.update("update " + tableName + " set s_id = ?, d_id = ?, p_id = ?, p_hiredate = ? where " + primaryKey + " = ?", datas);
    }

    /**
     * 删除编号为id的调动记录
     * @param id 调动记录的编号
     * @return 是否成功删除，成功为true
     */
    public static boolean delete(int id) {
        return General.delete(tableName, primaryKey, id); // 将当前表中主键值为id的元组删除
    }
}
