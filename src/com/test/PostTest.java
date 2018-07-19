package com.test;

import com.util.General;
import com.util.Post;
import org.junit.Test;

import java.sql.SQLException;

public class PostTest {

    @Test
    public void insert() throws SQLException {
        Post.insert("1");
    }

    @Test
    public void update() {
        Post.update(1, "小仙子美美");
    }

    @Test
    public void delete() {
        Post.delete(1);
        General.Stack.push("post", 1);
    }

    @Test
    public void test() throws Exception {
        for (int i = 1; i <= 10; i++) {
            Post.insert(String.valueOf(i));
        }
        System.out.println(General.resultSetToJSON(General.listAll("post")));
        Post.delete(1);
        General.Stack.push("post", 1);
        System.out.println(General.resultSetToJSON(General.listAll("post")));
        Post.insert("1");
        System.out.println(General.resultSetToJSON(General.listAll("post")));
    }
}