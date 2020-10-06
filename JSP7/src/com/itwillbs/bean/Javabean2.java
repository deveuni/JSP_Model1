package com.itwillbs.bean;

public class Javabean2 {
	// 아이디, 비밀번호, 숫자를 한번에 저장하는 타입
	
	
	private String id;
	private String pw;
	private int num;
	
	public Javabean2(){
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	
	// alt + shift s + s
	@Override
	public String toString() {
		return "Javabean2 [id=" + id + ", pw=" + pw + ", num=" + num + "]";
	}

	
/*	
@Override
	public String toString() {
		return super.toString();
	}
	*/
	
/*	public String toString(){
		return "id: "+id+"/ pw: "+pw+"/ num: "+num;
	}
	
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
