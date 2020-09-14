package com.cbnu;

import java.io.Serializable;

public class Person implements Serializable {
	private int id = 123142;
	private String name = "Hugh";
	
	public Person() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
