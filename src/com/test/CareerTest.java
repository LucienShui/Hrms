package com.test;

import com.util.Career;
import org.junit.Test;

import java.sql.SQLException;

public class CareerTest {
    @Test
    public void insert() throws SQLException {
       Career.insert(1,"清源公司","2017-12-6","2017-12-16");
        Career.insert(2,"仙女公司","2017-12-5","2017-12-18");

    }

    @Test
    public void update() throws SQLException {
        Career.update(3,1,"哈哈公司","2017-12-16","2017-12-19");
    }
    @Test
    public void delete()
    {
        Career.delete(3);
    }


}
