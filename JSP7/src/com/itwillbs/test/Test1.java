package com.itwillbs.test;


class Parent{
	int a; // 기본접근지정자 디폴트 있음.
	public void pprn(){
		System.out.println("Parent_pprn()!");
	}
}

class Child extends Parent{
	public void cprn(){
		System.out.println("Child_cprn()!");
	}
	
	// 오버라이딩 : 상속관계에서 부모의 메서드를 은닉하고  자식메서드로서 재정의(상속할때만)
	
	// public > protected > 기본접근지정자 > private
	// 오버라이딩할 때 접근지정자 범위 줄어들면 안됨. 범위 커지는 것은 상관업음.
	public void pprn(){ // 부모 메서드 보다 작은 접근지정자 나오면 오류발생
		super.pprn(); // 부모를 가르키는 참조변수
		System.out.println("Child_pprn()!");
	}
	
}

// 컴파일할 때 this, super만들어줌. 따로 만들지 않아도 됨.

public class Test1 {

	public static void main(String[] args) {
		 
		Parent p = new Parent(); // p는 참조변수
		p.pprn();
		// p.cprn(); 상속 안했으므로 
		System.out.println("------------");
		Child c = new Child();
		c.cprn();
		c.pprn();
		
		System.out.println("------------");
		
		// * 상속관계일 때만 가능
		// 업 캐스팅 : (자동형변환) 서브클래스를 부모클래스로 형변환
		//			슈퍼클래스의 레퍼런스에 서브클래스의 인스턴스(객체)를 저장.
		// 다운 캐스팅 : (강제형변환) 부모클래스를 서브클래스로 형변환
		//			서브클래스의 레퍼런스에 슈퍼클래스의 인스턴스를 저장.
		
		// 업캐스팅
		Parent p1 = new Child();
		//Parent p2 = c;
		
		p1.pprn();
		// p1.cprn(); 오류 
		// * 업캐스팅을 하면 상속받은 (parent)만 쓸 수 있음.
		// * 참조 영역이 감소했다.
		// * 컴파일러가 자동으로 형변환
		
		// 다운캐스팅
		
		//Child c1 = new Parent();
		// -> 컴파일에러 : 실행 전
		// Child c1 = (Child) new Parent();
		// -> 예외 (Exception) : 실행 후 메모리가 있느냐 판단할 때 발생
		// c1.pprn();
		// c1.cprn();
		//Child c2 = (Child) p;
		
		// * 다운캐스팅은 컴파일러가 자동으로 형변환X
		//  -> 해당 객체가 존재하지 않을 수 있기 때문에 
		// => 개발자가 직접 타입을 구현 => 예외 발생 
		
		Parent pp = new Child(); //업캐스팅 후  
		Child c1 = (Child) pp; // 다운 캐스팅하기! 그래야 값 다 나온다.
		// -> 강제형변환 : 문제를 인지하고 책임을 지겠다.(개발자)
		c1.pprn();
		c1.cprn();
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	}

}
