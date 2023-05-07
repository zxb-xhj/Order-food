package com.xhj.bean;

public class User {
    private int id;
    private String name ;
    private String pwd ;
    private int balance ;

    public User(){

    }
    public User(int id, String name, String pwd, int balance) {
        this.name = name;
        this.id = id;
        this.pwd = pwd;
        this.balance = balance;
    }
    public User(String name, String pwd) {
        this.name = name;
        this.pwd = pwd;
    }
    public User(int id,int balance) {
        this.id = id;
        this.balance = balance;
    }
    public User(int id,String pwd) {
        this.id = id;
        this.pwd = pwd;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", id='" + id + '\'' +
                ", password='" + pwd + '\'' +
                ", balance=" + balance +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }
}
