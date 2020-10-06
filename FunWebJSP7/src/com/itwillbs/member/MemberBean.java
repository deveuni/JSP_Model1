package com.itwillbs.member;

import java.sql.Date;


public class MemberBean {
	
	// 데이터를 저장하는 객체 (한번에 회워정보를 저장가능한 객체) 
	// => DB에 데이터 전달
	
	private String id;
	private String pass;
	private String name;
	private String email;
	private int birth;
	private String gender;
	private String addr;
	private String phone;
	private String mobile;
	private Date reg_date;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pass=" + pass + ", name=" + name + ", email=" + email + ", birth=" + birth
				+ ", gender=" + gender + ", addr=" + addr + ", phone=" + phone + ", mobile=" + mobile + ", reg_date="
				+ reg_date + "]";
	}
	
	
	

	
	
	

}
