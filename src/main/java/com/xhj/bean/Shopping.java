package com.xhj.bean;

public class Shopping {
    private Integer id;

    private String dname;

    private Integer number;

    private String price;

    private String taste;
    
    

    public Shopping() {
		super();
	}

	public Shopping(Integer id, String dname, Integer number, String price, String taste) {
		super();
		this.id = id;
		this.dname = dname;
		this.number = number;
		this.price = price;
		this.taste = taste;
	}
	public Shopping(String dname, Integer number, String price, String taste) {
		super();
		this.dname = dname;
		this.number = number;
		this.price = price;
		this.taste = taste;
	}
	public Shopping(Integer id,Integer number) {
		super();
		this.id = id;
		this.number = number;
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

    @Override
    public String toString() {
        return "Shopping{" +
                "id=" + id +
                ", dname='" + dname + '\'' +
                ", number=" + number +
                ", price='" + price + '\'' +
                ", taste='" + taste + '\'' +
                '}';
    }
}