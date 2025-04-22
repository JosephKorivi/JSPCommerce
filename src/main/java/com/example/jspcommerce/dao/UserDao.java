package com.example.jspcommerce.dao;

import com.example.jspcommerce.models.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
    private Connection con;
    private String query;
    private PreparedStatement ps;
    private ResultSet rs;

    public UserDao(Connection con) {
        this.con = con;
    }

    public User userLogin (String email, String password) {
        User user = null;
        try {
            query = "SELECT * FROM users WHERE email = ? AND password = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return user;
    }
}
