package com.util;

import com.sql.SqlEditor;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Foreign {
    private static String tableName = "foreign"; // 表名
    private static String primaryKey = "fo_id"; // 主码名称

    /**
     * 插入
     * @param s_id 员工编号
     * @param fo_type 外语种类
     * @param fo_level 外语水平
     * @return 插入是否成功，成功返回true，失败返回false
     * @throws SQLException 数据库操作错误
     */
    public static boolean insert(int s_id, String fo_type, int fo_level) throws SQLException {
        SqlEditor sql = new SqlEditor(); // 数据库编辑器对象
        List<List<Object>> datas = new ArrayList<>(); // 传入的datas二维数组
        datas.add(Arrays.asList(General.getId(tableName), s_id, fo_type, fo_level)); // 将参数插入datas
        // 执行插入，并将返回结果保存至flag中
        boolean flag = sql.update("insert into `" + tableName + "` values (?, ?, ?, ?)", datas) != 0;
        if (flag) General.idUpdate(tableName); // 如果插入成功，则将这张表的最小可用id增加1
        return flag; // 返回操作是否成功
    }

    /**
     * 更新外语条目
     * @param fo_id 欲更新的条目的编号
     * @param s_id 员工编号
     * @param fo_type 更新至fo_type外语种类
     * @param fo_level 更新至fo_level外语水平
     * @return 影响的行数
     */
    public static int update(int fo_id, int s_id, String fo_type, int fo_level) {
        SqlEditor sql = new SqlEditor(); // 数据库编辑器对象
        List<List<Object>> datas = new ArrayList<>(); // 传入的datas二维数组
        datas.add(Arrays.asList(s_id, fo_type, fo_level, fo_id)); // 将参数插入datas
        // 执行更新操作，并返回影响的行数
        return sql.update("update `" + tableName + "` set s_id = ?, fo_type = ?, fo_level = ? where " + primaryKey + " = ?", datas);
    }

    /**
     * 删除编号为id的外语条目
     * @param id 外语条目编号
     * @return true(删除成功) or false(删除失败)
     */
    public static boolean delete(int id) {
        return General.delete(tableName, primaryKey, id); // 将当前表中主键值为id的元组删除
    }
}
