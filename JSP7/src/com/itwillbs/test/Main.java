package com.itwillbs.test;

public class Main {
	
	// 총합을 계산해서 출력해주는 메서드
	public void Sum(int k, int m, int e){
		System.out.println("총합(메서드): "+(k+m+e)+"점");
	}
	
	
	// 평균을 계산해서 결과를 리턴하는 메서드
	public static double Avg(int k, int m, int e){
		
		return (k+m+e) / 3.0;
	}

	public static void main(String[] args) {
		// 패키지명 -> 회사의 도메인 주소를 사용(중복불가)
		// www.itwillbs.com
		// com.itwillbs.패키지명
		// kr.co.itwillbs.패키지명
		
		String stuNum = "will0001";
		String name = "홍길동";
		int kor = 90;
		int eng = 85;
		int math = 95;
		
		// 학생의 총점과 평균을 계산하는 동작 구현 
		
		System.out.println("학번: "+stuNum+","+"이름: "+name+", 총합: "+(kor+eng+math)+", 평균: "+(kor+eng+math)/3);
		
		Main m = new Main();
		m.Sum(kor,math,eng);
		//new Main().Sum(kor,math,eng); -> 가바지 값/ 가능하면 위에 방법으로 사용하기 
		
		System.out.println("평균(메서드): "+Main.Avg(kor,math,eng));
		
		
		// => 계산기 객체 생성, 총합 동작, 평균 동작(결과 출력)
		//    Calc
		
		
		Calc c = new Calc();
		c.Sum(kor, eng, math);
		
		c.Avg(kor, eng, math);
		
		StuScore kim = new StuScore();
		
		kim.setKor(kor);
		kim.setEng(eng);
		kim.setMath(math);
		
		c.Sum(kim);
		c.Avg(kim);
		
		StuScore kim2 = new StuScore(kor,eng,math);
		
	
	}//main
	
	

}//class

	


