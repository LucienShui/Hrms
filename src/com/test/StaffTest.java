package com.test;

import com.util.Staff;
import org.junit.Test;

import java.sql.SQLException;

public class StaffTest {
    @Test
    public void insert() throws SQLException {
        Staff.insert("刘凤",1,1);
        Staff.insert("水清源",1,1);

    }
    @Test
    public void update(){
        Staff.update(2,"刘凤",2,2);
    }
    @Test
    public void delete(){
        Staff.delete(2);
    }






}
