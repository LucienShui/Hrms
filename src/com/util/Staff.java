package com.util;

import com.sql.SqlEditor;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//对Staff表进行操作(员工基本信息表）
public class Staff {
    private static String tableName = "staff"; //表名Staff
    private static String primaryKey = "s_id";//Staff主键s_id

    /**
     * 插入员工信息
     * @param s_name 员工姓名
     * @param d_id   员工所在部门编号
     * @param p_id   员工所在岗位编号
     * @return 插入是否成功，成功返回true，失败返回false
     * @throws SQLException 数据库操作错误
     */
    public static boolean insert(String s_name, int d_id, int p_id) throws SQLException {
        SqlEditor sql = new SqlEditor();
        List<Object> keys = new ArrayList<>();
        keys.add(General.getId(tableName));
        keys.add(s_name);
        keys.add(d_id);
        keys.add(p_id);
        List<List<Object>> datas = new ArrayList<>();
        datas.add(keys);
        boolean flag = sql.update("insert into " + tableName + " values (?, ?, ?, ?)", datas) != 0;
        if (flag) General.idUpdate(tableName);
        return flag;
    }

    /**
     * *更新员工信息
     * @param s_id 员工编号
     * @param s_name 员工姓名
     * @param d_id 员工所在部门编号
     * @param p_id 员工所在岗位编号
     * @return 影响的行数
     */
    public static int update(int s_id, String s_name, int d_id, int p_id) {
        SqlEditor sql = new SqlEditor();
        List<Object> keys = new ArrayList<>();
        keys.add(s_name);
        keys.add(d_id);
        keys.add(p_id);
        keys.add(s_id);
        List<List<Object>> datas = new ArrayList<>();
        datas.add(keys);
        return sql.update("update " + tableName + " set s_name = ?, d_id = ?, p_id = ? where " + primaryKey + " = ?", datas);
    }

    public static boolean delete(int id) {
        return General.delete(tableName, primaryKey, id);
    }
}
