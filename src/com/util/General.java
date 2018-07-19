package com.util;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.sql.SqlEditor;
import org.junit.runner.Result;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class General {
    /**
     * 各种表的id栈
     */
    public static class Stack {
        /**
         * push操作，向名为tableName的表的id栈中push一个废弃的id
         *
         * @param tableName 表名
         * @param value     id
         * @return true(成功push) or false(失败)
         */
        public static boolean push(String tableName, int value) {
            SqlEditor sqlEditor = new SqlEditor(); // 数据库编辑器对象
            List<List<Object>> datas = new ArrayList<>(); // 传入的数据
            datas.add(Arrays.asList(tableName, value)); // 将数据压入
            sqlEditor.update("INSERT INTO idStack VALUES (?, ?)", datas); // 进行查询
            return true;
        }

        /**
         * 取名为tableName的id栈顶
         *
         * @param tableName 表名
         * @return 栈顶元素
         * @throws SQLException 数据库查询错误
         */
        public static int top(String tableName) throws SQLException {
            SqlEditor sqlEditor = new SqlEditor();
            ResultSet resultSet = sqlEditor.query("SELECT `id` FROM `idStack` WHERE `tableName` = ? ORDER BY `id`", Arrays.asList(tableName));
            if (resultSet.next()) return resultSet.getInt("id"); // 如果栈不为空返回栈顶
            return -1; //如果栈为空则返回-1
        }

        /**
         * 弹出栈顶元素
         *
         * @param tableName 表名字
         * @throws SQLException 数据库错误
         */
        public static void pop(String tableName) throws SQLException {
            SqlEditor sqlEditor = new SqlEditor();
            sqlEditor.update("DELETE FROM `idStack` WHERE `tableName` = ? and `id` = ?", Arrays.asList(Arrays.asList(tableName, top(tableName))));
        }
    }

    /**
     * 返回某张表里当前可用的最小的id
     *
     * @param tableName 表名
     * @return 一个整数，代表下一个id
     * @throws SQLException 数据库异常
     */
    public static int getId(String tableName) throws SQLException {
        if (Stack.top(tableName) != -1) return Stack.top(tableName); // 如果Stack不为空，那么取Stack内最小的id
        SqlEditor sqlEditor = new SqlEditor(); // 数据库编辑器对象
        ResultSet resultSet = sqlEditor.query( // 从表中获取对应表明的最大的id
                "select maxId from idSet where tableName = '" + tableName + "'",
                null
        );
        if (resultSet.next()) { // 如果结果不为空
            return resultSet.getInt("maxId");
        }
        return 0; // 如果结果为空，返回0，代表异常
    }

    /**
     * 更新对应表的可用id集
     *
     * @param tableName 表名
     */
    public static void idUpdate(String tableName) throws SQLException {
        if (Stack.top(tableName) != -1) Stack.pop(tableName); // 如果栈不为空，pop一下
        else {
            SqlEditor sqlEditor = new SqlEditor();
            sqlEditor.update("update idset set maxId = maxId + 1 where tableName = '" + tableName + "'", null);
        }
    }

    /**
     * 将名为tableName的表中的所有数据以ResultSet的形式返回
     *
     * @param tableName 表名
     * @return ResultSet，代表这张表里所有的东西
     */
    public static ResultSet listAll(String tableName) {
        SqlEditor sqlEditor = new SqlEditor(); // 新建数据库编辑器对象
        String primaryKey;
        if (tableName.substring(0, 1).equals("f")) {
            primaryKey = tableName.substring(0, 2) + "_id";
        } else primaryKey = tableName.substring(0, 1) + "_id";
        return sqlEditor.query(String.format("select * from `%s` order by `%s`", tableName, primaryKey), null); // 列出所有元素
    }

    /**
     * 将ReslutSet型数据转换为JSON数据
     *
     * @param resultSet 需要转换的ResultSet
     * @return 字符串类型的JSON
     * @throws Exception 转换过程中产生的异常
     */
    public static String resultSetToJSON(ResultSet resultSet) throws Exception {
        JSONArray jsonArray = new JSONArray(); // JSON数组
        ResultSetMetaData metaData = resultSet.getMetaData();
        int columnCount = metaData.getColumnCount(); // 获取列数
        while (resultSet.next()) { // 遍历ResultSet中的每条数据
            JSONObject jsonObject = new JSONObject();
            for (int i = 1; i <= columnCount; i++) { // 遍历每一列
                String columnLabel = metaData.getColumnLabel(i);
                Object value = resultSet.getObject(columnLabel);
                jsonObject.put(columnLabel, value.toString());
            }
            jsonArray.add(jsonObject);
        }
        return jsonArray.toString();
    }

    /**
     * 删除tableName这张表中列名为columnName的列中值为value的所有元组
     *
     * @param tableName  欲修改的表的名字
     * @param columnName 列明
     * @param value      键值
     * @return 布尔类型，true代表删除成功，false代表失败
     */
    public static boolean delete(String tableName, String columnName, int value) {
        SqlEditor sql = new SqlEditor();
        return sql.update("delete from `" + tableName + "` where " + columnName + " = " + String.valueOf(value), null) > 0;
    }

    /**
     * 判断在tableName这张表里列名为key的列中是否存在值为value的元组
     *
     * @param tableName  表名
     * @param columnName 列名
     * @param value      键值
     * @return true(存在) or false(不存在)
     * @throws SQLException 数据库异常
     */
    public static boolean exist(String tableName, String columnName, Object value) throws SQLException {
        SqlEditor sql = new SqlEditor();
        ResultSet resultSet = sql.query(String.format("select * from `%s` where `%s` = ?", tableName, columnName), Arrays.asList(value));
        return resultSet.next();
    }

    public static String zeroExtend(int val) {
        return String.format("%09d", val);
    }

    public static Object query(String tableName, String key, Object val, String aimKey) {
        try {
            SqlEditor sqlEditor = new SqlEditor();
            ResultSet resultSet = sqlEditor.query(String.format("select `%s` from `%s` where `%s` = ?", aimKey, tableName, key), Arrays.asList(val));
            if (resultSet.next()) return resultSet.getObject(aimKey);
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static boolean update(String tableName, String key, Object keyVal, String aimKey, Object aimVal) {
        int cnt = 0;
        try {
            SqlEditor sqlEditor = new SqlEditor();
            cnt = sqlEditor.update(String.format("UPDATE `%s` SET `%s` = ? WHERE `%s` = ?", tableName, aimKey, key), Arrays.asList(Arrays.asList(aimVal, keyVal)));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cnt > 0;
    }
}
