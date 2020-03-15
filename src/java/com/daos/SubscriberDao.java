package com.daos;

import com.beans.Subscriber;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.jdbc.ConnectionPool;

public class SubscriberDao {

    public boolean add(Subscriber sub) {
        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();

        if (con != null) {
            try {
                String sql = "Insert into subscriber(name, email) values(?,?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, sub.getName());
                smt.setString(2, sub.getEmail());
                smt.executeUpdate();
                status = true;
                cp.putConnection(con);
                smt.close();
                //cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("DBError :" + e.getMessage());
            }
        }

        return status;
    }

}
