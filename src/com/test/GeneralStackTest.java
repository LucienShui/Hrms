package com.test;

import com.util.General;
import org.junit.Test;

import java.sql.SQLException;

public class GeneralStackTest {
    @Test
    public void push() throws SQLException {
        General.Stack.push("123", 1);
        General.Stack.push("123", 2);
        General.Stack.push("234", 1);
        System.out.println(General.Stack.top("123"));
        General.Stack.pop("123");
        System.out.println(General.Stack.top("123"));
    }
}