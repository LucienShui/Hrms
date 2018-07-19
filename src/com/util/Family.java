package com.util;

import com.sql.SqlEditor;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Family {
    private static String tableName = "family"; // 表名
    private static String primaryKey = "fa_id"; // 主码名称

    /**
     * 插入
     * @param s_id 员工编号
     * @param fa_member 家庭成员
     * @param fa_relation 社会关系
     * @return 插入是否成功，成功返回true，失败返回false
     * @throws SQLException 数据库操作错误
     */
    public static boolean insert(int s_id, String fa_member, String fa_relation) throws SQLException {
        SqlEditor sql = new SqlEditor(); // 数据库编辑器对象
        List<List<Object>> datas = new ArrayList<>(); // 传入的datas二维数组
        datas.add(Arrays.asList(General.getId(tableName), s_id, fa_member, fa_relation)); // 将参数插入datas
        // 执行插入，并将返回结果保存至flag中
        boolean flag = sql.update("insert into " + tableName + " values (?, ?, ?, ?)", datas) != 0;
        if (flag) General.idUpdate(tableName); // 如果插入成功，则更新这张表的最小可用id
        return flag; // 返回操作是否成功
    }

    /**
     * 更新外语条目
     * @param fa_id 欲更新的条目的编号
     * @param s_id 员工编号
     * @param fa_member 更改的家庭成员的名称
     * @param fa_relation 更新社会关系
     * @return 影响的行数
     */
    public static int update(int fa_id, int s_id, String fa_member, String fa_relation) {
        SqlEditor sql = new SqlEditor(); // 数据库编辑器对象
        List<List<Object>> datas = new ArrayList<>(); // 传入的datas二维数组
        datas.add(Arrays.asList(s_id, fa_member, fa_relation, fa_id)); // 将参数插入datas
        // 执行更新操作，并返回影响的行数
        return sql.update("update " + tableName + " set s_id = ?, fa_member = ?, fa_relation = ? where " + primaryKey + " = ?", datas);
    }

    /**
     * 删除编号为id的外语条目
     * @param id 条目编号
     * @return true(删除成功) or false(删除失败)
     */
    public static boolean delete(int id) {
        return General.delete(tableName, primaryKey, id); // 将当前表中主键值为id的元组删除
    }
}
