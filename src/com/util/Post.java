package com.util;

import com.sql.SqlEditor;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

// 对岗位数据表的增删改操作的封装
public class Post {
    private static String tableName = "post"; // 表名
    private static String primaryKey = "p_id"; // 主码名称

    /**
     * 插入
     * @param p_name 岗位名称
     * @return 插入是否成功，成功返回true，失败返回false
     * @throws SQLException 数据库操作错误
     */
    public static boolean insert(String p_name) throws SQLException {
        SqlEditor sql = new SqlEditor(); // 数据库编辑器对象
        List<List<Object>> datas = new ArrayList<>(); // 传入的datas二维数组
        datas.add(Arrays.asList(General.getId(tableName), p_name)); // 将参数插入datas
        // 执行插入，并将返回结果保存至flag中
        boolean flag = sql.update("insert into " + tableName + " values (?, ?)", datas) != 0;
        if (flag) General.idUpdate(tableName); // 如果插入成功，则将这张表的最小可用id增加1
        return flag; // 返回操作是否成功
    }

    /**
     * 更新岗位信息
     * @param p_id 欲更新的岗位的岗位号
     * @param p_name 新名字
     * @return 影响的行数
     */
    public static int update(int p_id, String p_name) {
        SqlEditor sql = new SqlEditor(); // 数据库编辑器对象
        List<List<Object>> datas = new ArrayList<>(); // 传入的datas二维数组
        datas.add(Arrays.asList(p_name, p_id)); // 将参数插入datas
        // 执行更新操作，并返回影响的行数
        return sql.update("update " + tableName + " set p_name = ? where " + primaryKey + " = ?", datas);
    }

    /**
     * 删除编号为id的岗位
     * @param id 岗位的编号
     * @return 是否成功删除，成功为true
     */
    public static boolean delete(int id) {
        return General.delete(tableName, primaryKey, id); // 将当前表中主键值为id的元组删除
    }
}
