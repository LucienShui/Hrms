package com.util;

import com.sql.SqlEditor;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Department {
    private static String tableName = "department";
    private static String primaryKey = "d_id";
    public static boolean insert(String d_name, String d_phone, int d_num_people, String d_superior) throws SQLException {
        SqlEditor sql = new SqlEditor();
        List<List<Object>> datas = new ArrayList<>();
        datas.add(Arrays.asList(General.getId(tableName), d_name, d_phone, d_num_people, d_superior));
        boolean flag = sql.update("insert into " + tableName + " values (?, ?, ?, ?, ?)", datas) != 0;
        if (flag) General.idUpdate(tableName);
        return flag;
    }
    public static int update(int d_id, String d_name, String d_phone, int d_num_people, String d_superior) throws SQLException {
        SqlEditor sql = new SqlEditor();
        List<List<Object>> datas = new ArrayList<>();
        datas.add(Arrays.asList(d_name, d_phone, d_num_people, d_superior, d_id));
        return sql.update("update " + tableName + " set d_name = ?, d_phone = ?, d_num_people = ?, d_superior = ? " +
                "where " + primaryKey + " = ?", datas);
    }
    public static boolean delete(int id) {
        return General.delete(tableName, primaryKey, id);
    }
}
