package com.xhj.bean;

import java.util.Date;

public class Orde {
    private Integer id;

    private String dname;

    private Integer number;

    private String price;

    private String taste;

    private Integer sid;

    private String sj;

    private int userid;

    public Orde() {
    }

    public Orde(Integer id, String dname, Integer number, String price, String taste, Integer sid, String sj,int userid) {
        this.id = id;
        this.dname = dname;
        this.number = number;
        this.price = price;
        this.taste = taste;
        this.sid = sid;
        this.sj = sj;
        this.userid = userid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname == null ? null : dname.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price == null ? null : price.trim();
    }

    public String getTaste() {
        return taste;
    }

    public void setTaste(String taste) {
        this.taste = taste == null ? null : taste.trim();
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getSj() {
        return sj;
    }

    public void setSj(String sj) {
        this.sj = sj;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    @Override
    public String toString() {
        return "Orde{" +
                "id=" + id +
                ", dname='" + dname + '\'' +
                ", number=" + number +
                ", price='" + price + '\'' +
                ", taste='" + taste + '\'' +
                ", sid=" + sid +
                ", sj='" + sj + '\'' +
                '}';
    }
}