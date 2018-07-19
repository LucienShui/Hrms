package com.sql;

import java.sql.*;
import java.util.*;

public class SqlEditor {

    private String driver = ResourceBundle.getBundle("mysql").getString("driver");
    private String url = ResourceBundle.getBundle("mysql").getString("url");
    private String username = ResourceBundle.getBundle("mysql").getString("username");
    private String password = ResourceBundle.getBundle("mysql").getString("password");
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    public SqlEditor() {
        getConnection();
    }
    private Connection getConnection() {
        try {
            Class.forName(driver);
            if (connection == null || connection.isClosed()) {
                connection = DriverManager.getConnection(url, username, password);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return connection;
    }

    private void closeConnection() {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int update(String sqlStatement, List<List<Object>> datas) {
        int affectRowCount = 0;
        if (getConnection() == null) return -1;
        try {
            preparedStatement = connection.prepareStatement(sqlStatement);
            connection.setAutoCommit(false);
            if (datas != null && datas.size() > 0) {
                for (List<Object> keys : datas) {
                    for (int j = 0; j < keys.size(); j++) {
                        preparedStatement.setObject(j + 1, keys.get(j));
                    }
                    preparedStatement.addBatch();
                }
                int[] array = preparedStatement.executeBatch();
                connection.commit();
                affectRowCount = array.length;
            } else {
                affectRowCount = preparedStatement.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }
        } finally {
            closeConnection();
        }
        return affectRowCount;
    }

    public ResultSet query(String sqlStatement, List<Object> params) {
        if (getConnection() == null) return null; // 获得连接
        try {
            preparedStatement = connection.prepareStatement(sqlStatement); // 查询语句
            if (params != null && params.size() > 0) { //
                for (int i = 0; i < params.size(); i++) {
                    preparedStatement.setObject(i + 1, params.get(i));
                }
            }
            resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }
}

