package com.util;

import com.sql.SqlEditor;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Career {
    private static String tableName = "career";
    private static String primaryKey = "c_id";

    public static boolean insert(int s_id, String c_company, String c_hiredate, String c_leavedate) throws SQLException {
        SqlEditor sql = new SqlEditor();
        List<List<Object>> datas = new ArrayList<>();
        datas.add(Arrays.asList(General.getId(tableName), s_id, c_company, c_hiredate, c_leavedate));
        boolean flag = sql.update("insert into " + tableName + " values (?, ?, ?, ?, ?)", datas) != 0;
        if (flag) General.idUpdate(tableName);
        return flag;
    }

    public static int update(int c_id, int s_id, String c_company, String c_hiredate, String c_leavedate) throws SQLException {
        SqlEditor sql = new SqlEditor();
        List<List<Object>> datas = new ArrayList<>();
        datas.add(Arrays.asList(s_id, c_company, c_hiredate, c_leavedate, c_id));
        return sql.update("update " + tableName + " set s_id = ?, c_company = ?, c_hiredate = ?, c_leavedate = ? " +
                "where " + primaryKey + " = ?", datas);
    }

    public static boolean delete(int id) {
        return General.delete(tableName, primaryKey, id);
    }
}
