package com.itwillbs.test;

public class StuScore {
	// 학생의 정보를 저장하는 객체(국, 영, 수)
	private int kor;
	private int eng;
	private int math;
	
	
	// 기본생성자는 컴파일러가 자동으로 생성
	// => 오버로딩된 생성자가 없을 경우만 생성
	public StuScore(){} 
	// 생성자 오버로딩 가능, 메서드이기 때문
	public StuScore(int k, int e, int m){
		kor = k;
		this.eng = e;
		math = m;
	}
	
	// alt + shit + s
	// set/get
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	
	
	
	
	
	
	
	

}
