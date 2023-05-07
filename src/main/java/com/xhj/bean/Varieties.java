package com.xhj.bean;

public class Varieties {
    private Integer id;

    private String name;

    

	public Varieties() {
		super();
	}

	public Varieties(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public Varieties(String name) {
		super();
		this.name = name;
	}
	public Varieties(Integer id) {
		super();
		this.id = id;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}