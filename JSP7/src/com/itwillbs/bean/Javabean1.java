package com.itwillbs.bean;

public class Javabean1 {//클래스(사용자 정의 타입) - public
	
	private String id; // 멤버 변수 - private
	
	public Javabean1(){} // 습관적으로 기본생성자 만들기

	public String getId() { // set,get은 public
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
 
}
