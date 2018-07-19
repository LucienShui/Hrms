package com.test;

import com.util.Department;
import org.junit.Test;

import java.sql.SQLException;

public class DepartmentTest {

    @Test
    public void addDepartment() throws SQLException {
        if (Department.insert("CMCC", "10086", 13, "1")) System.out.println("Yes");
        else System.out.println("No");

    }

    @Test
    public void deleteDepartment() {
        Department.delete(3);
    }

    @Test
    public void updateDepartment() throws SQLException {
        Department.update(3,"China-Mobile", "10010", 12, "2");
    }
}