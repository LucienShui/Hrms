package com.test;

import com.util.Transfer;
import org.junit.Test;

import java.sql.SQLException;

public class TransferTest {
    @Test
    public void insert() throws SQLException {
        Transfer.insert(1,2,3,"2017-6-15");
    }
    @Test
    public void update()
    {
        Transfer.update(1,2,3,4,"2017-9-1");
    }
    @Test
    public void delete()
    {
        Transfer.delete(1);

    }
}
