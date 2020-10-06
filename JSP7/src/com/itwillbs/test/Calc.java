package com.itwillbs.test;

public class Calc {
	
	// 계산기 클래스
	/*String stuNum = "will0001";
	String name = "홍길동";
	int kor = 90;
	int eng = 85;
	int math = 95;*/
	
	// 메서드는 저장해서 출력만 하면 되므로 저장할 필요가ㅏ 없다.
	// 총합 계산 후 출력
	public void Sum(int k, int e, int m){
		 System.out.println("총합: "+(k+e+m));
	}
	
	
	// 평균을 계산 후 출력
	public void Avg(int k, int e, int m){
		 System.out.println("평균: "+(k+e+m)/3);
		 
	}
	
	// 총합 - 학생 점수 객체 사용
	public void Sum(StuScore s){
		System.out.println("총합: "+(s.getKor()+s.getEng()+s.getMath()));
		
	}
	
	
	// 평균 - 학생 점수 객체 사용
	public void Avg(StuScore s ){
		System.out.println("평균: "+(s.getKor()+s.getEng()+s.getMath())/3.0);
		
	}
	



}