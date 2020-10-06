package com.itwillbs.test;

public class Test2 {

	public static void main(String[] args) {
		// Wrapper 클래스 (8개) 
		// -> 기본형 데이터를 객체로 사용할 수 있도록 만든 클래스
		// => 기본형 데이터의 본질은 그대로 두고, 인터페이스만 제공하는 클래스
		
		/* 
		 * [기본형 타입]        [참조형타입(Wrapper)]
		 *  boolean            Boolean
		 *  char               Character     
		 *  byte               Byte
		 *  short              Short
		 *  int                Integer
		 *  long               Long
		 *  float              Float
		 *  double             Double
		 */
		
		// 오토 박싱 & 오토 언박싱 (JDK6 이후 도입)
		// 박싱 : 값 형식의 데이터(기본형타입)를 참조형 형식의 데이터로 변환
		//   -> 스텍에 있는 값을 힙에 전달
		// 언박싱 : 참조형 형식의 데이터를 값 형식의 데이터로 변환
		//   -> 힙에 있는 값을 스텍에 전달
		
		
		
		int num01 = 100;
		int num02;
		
		Integer NUM01 = new Integer(200);
		Integer NUM02;
		
		NUM02 = num01; // 오토 박싱
		//  -> 1.6이전 박싱
		NUM02 = new Integer(num01);
		
		num02 = NUM01; // 오토 언박싱
		//  -> 1.6 이전 언박싱
		num02 = NUM01.intValue();
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	}

}
