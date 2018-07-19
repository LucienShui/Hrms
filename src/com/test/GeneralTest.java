package com.test;

import com.util.General;
import org.junit.Test;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class GeneralTest {

    @Test
    public void increaseId() throws SQLException {
        String tableName = "department";
        System.out.println(General.getId(tableName));
        General.idUpdate(tableName);
        System.out.println(General.getId(tableName));
    }

    @Test
    public void getId() throws SQLException {
        System.out.println(General.getId("department"));
    }

    @Test
    public void test() {
//        String date = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
//        System.out.println(date.toString());
//        System.out.println(date);
        String type = "department";
        int oldId = 1;
        General.update(type, "d_id", oldId, "d_num_people", (int) General.query(type, "d_id", oldId, "d_num_people") - 1);
    }

    @Test
    public void listAll() throws SQLException {
        ResultSet resultSet = General.listAll("idSet");
        while (resultSet.next()) {
            System.out.println(resultSet.getString("tableName") + " " + resultSet.getInt("maxId"));
        }
    }

    @Test
    public void singleQueryTest() {
        System.out.println(General.query("users", "username", "admin", "password"));
    }

    @Test
    public void singleUpdateTest() {
        General.update("users", "username", "admin", "password", "admin");
    }

    @Test
    public void sesultSetToJSON() throws Exception {
        ResultSet resultSet = General.listAll("idSet");
        System.out.println(General.resultSetToJSON(resultSet));
    }

    @Test
    public void mathTest() {
        int a = 12;
        System.out.println(a / 10 + (a % 10 > 0 ? 1 : 0));
    }

    @Test
    public void exist() throws SQLException {
        if (General.exist("Department", "d_name", "CMCC")) {
            System.out.println("刘凤真好看啊");
        } else {
            System.out.println("刘凤不好看是不可能的啊");
        }
    }
}