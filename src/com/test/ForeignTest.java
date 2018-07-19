package com.test;

import com.util.Foreign;
import org.junit.Test;

import java.sql.SQLException;

public class ForeignTest {
    @Test
    public void insert() throws SQLException {
        Foreign.insert(3, "Chinese", 10);
    }
    @Test
    public void update() throws SQLException {
        Foreign.update(1,5, "Chinese", 10);
    }
   @Test
    public void delete(){
        Foreign.delete(1);
   }

}

