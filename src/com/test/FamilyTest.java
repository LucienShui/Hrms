package com.test;

import com.util.Family;
import org.junit.Test;

import java.sql.SQLException;

public class FamilyTest{
    @Test
    public void insert() throws SQLException {
        Family.insert(2,"水清源","配偶");
    }
    @Test
    public void update() {
        Family.update(1,2,"刘凤","配偶");
    }
    @Test
    public void delete() {
        Family.delete (1);
        Family.delete(2);
    }

}
