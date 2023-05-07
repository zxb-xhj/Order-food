package com.xhj.bean;

public class Dishes {
    private Integer id;

    private String dname;

    private Integer number;

    private String price;

    private Integer vid;
    
    public Dishes() {
		super();
	}

	public Dishes(Integer id, String dname, Integer number, String price, Integer vid) {
		super();
		this.id = id;
		this.dname = dname;
		this.number = number;
		this.price = price;
		this.vid = vid;
	}
	public Dishes(Integer id, String dname, String price, Integer vid) {
		super();
		this.id = id;
		this.dname = dname;
		this.price = price;
		this.vid = vid;
	}
	public Dishes(String dname, Integer number, String price, Integer vid) {
		super();
		this.dname = dname;
		this.number = number;
		this.price = price;
		this.vid = vid;
	}
	public Dishes(String dname,String price, Integer vid) {
		super();
		this.dname = dname;
		this.price = price;
		this.vid = vid;
	}
	public Dishes(Integer id, Integer number) {
		super();
		this.id = id;
		this.number = number;
	}
	public Dishes(String dname) {
		super();
		this.dname = dname;
	}
	public Dishes(Integer id) {
		super();
		this.id = id;
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

    public Integer getVid() {
        return vid;
    }

    public void setVid(Integer vid) {
        this.vid = vid;
    }

	@Override
	public String toString() {
		return "Dishes [id=" + id + ", dname=" + dname + ", number=" + number + ", price=" + price + ", vid=" + vid
				+ "]";
	}
    
    
}