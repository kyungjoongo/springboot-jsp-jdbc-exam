package com.sample.model;

/**
 * Created by sample on 2017-05-03.
 */
public class Account {

    private String id;
    private String password;

    public Account(String id, String password) {
        this.id = id;
        this.password = password;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
