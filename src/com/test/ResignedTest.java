package com.test;

import com.util.Resigned;
import org.junit.Test;

import java.sql.SQLException;

public class ResignedTest {
    @Test
    public void insert() throws SQLException {
        Resigned.insert(1,"2018-5-4");
    }
    @Test
    public void update()
    {
        Resigned.update(1,5,"2018-6-1");
    }
    @Test
    public void delete()
    {
        Resigned.delete(1);
    }
}
