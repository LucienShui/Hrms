package com.test;

import com.util.*;
import org.junit.Test;

import java.sql.SQLException;

public class InitTable {

    @Test
    public void Init() throws SQLException {
        Department.insert("开发部","17863925912",8,"董事会");
        Department.insert("董事会","15689136509",7,null);
        Department.insert("市场部","13785207786",6,"董事会");
        Department.insert("测试部","13731462636",5,"开发部");
        Department.insert("财务部","13785200860",6,"董事会");

        Post.insert("经理");
        Post.insert("秘书");
        Post.insert("助理");
        Post.insert("文员");

        Staff.insert("刘凤",4,1);
        Staff.insert("水清源",2,1);
        Staff.insert("宋吉林",1,4);
        Staff.insert("杨成龙",3,2);
        Staff.insert("翟文正",5,3);

        Career.insert(1,"清源公司","2017-12-6","2017-12-16");
        Career.insert(1,"仙子公司","2017-12-18","2017-12-20");
        Career.insert(3,"美美公司","2018-6-6","2018-7-16");
        Career.insert(2,"丑丑公司","2018-8-5","2018-12-18");

        Family.insert(1,"水清源","母子");
        Family.insert(2,"水果果","父女");
        Family.insert(1,"小刘海儿","母女");
        Family.insert(3,"小啊","父子");
        Family.insert(4,"小不","父子");
        Family.insert(5,"小从","父子");

        Foreign.insert(1,"English",4);
        Foreign.insert(2,"English",2);
        Foreign.insert(3,"English",4);
        Foreign.insert(4,"English",4);
        Foreign.insert(5,"English",4);


        Transfer.insert(1,2,1,"2018-6-5");
        Transfer.insert(2,1,4,"2018-6-6");
        Transfer.insert(2,0,3,"2018-6-15");
        Transfer.insert(3,1,2,"2018-6-7");
        Transfer.insert(4,1,2,"2018-6-12");


        Resigned.insert(2,"2018-7-16");
        Resigned.insert(4,"2018-7-26");





    }
}
