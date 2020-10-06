package com.itwillbs.test;

import java.util.Hashtable;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
import java.util.Stack;
import java.util.Vector;



public class Test4 {

	public static void main(String[] args) {
		// ArrayList - 동기화 기능 X (클라이언트)
		// Vector - 동기화 기능 O (서버)
		
		// 생성시 4칸 짜리 배열, 필요시마다 3칸씩 추가 
		Vector vec = new Vector(4,10);
		
		
		System.out.println("백터의 크기 :" + vec.size());
		System.out.println("백터의 용량 :" + vec.capacity());
		
		for(int i=0;i<5;i++)
			vec.add(i*100);
		
		
		System.out.println(vec);
		System.out.println("백터의 크기 :" + vec.size());
		System.out.println("백터의 용량 :" + vec.capacity());
		
		System.out.println(" 첫번째 요소 :"+vec.firstElement());
		System.out.println(" 두번째 요소 : "+vec.get(1));
		System.out.println(" 마지막 요소 : "+vec.lastElement());
		
		System.out.println("-----------------------------------");
		
		/*double[] a = new double[3];
		a[0] = 1.1;
		double[] b = {1.1, 2.2};*/
		
		//double[] arr = new double[10]{38.6, 9.2, 45.6, 6.1, 4.7, 1.5};
		
		
		// 백터를 하나 생성해서 배열의 모든 요소를 순차적으로 저장
		double[] arr 
			= new double[]{38.6, 9.2, 45.6, 6.1, 4.7, 1.5}; // [] 안에 인자가 없는 상태로 사용 
		
		Vector v = new Vector();
		
		for(double d :arr){
			v.add(d);
		}
		
		// 요소 출력(확인)
		System.out.println(v);
		
		// 해당 요소 검색 
		// [ 1.5 ] 요소가 있으면 해당 요소의 위치 출력
		//     "        없으면 해당 요소의 위치값(-1) 출력
		
		int index = v.indexOf(1.5);
		
		if(index != -1){
			System.out.println("검색 성공! : "+index);
		}else{
			System.out.println("검색 실패! : "+index);
		}
		
		
		// 데이터 삭제 
		// [ 45.6 ] 데이터가 있을 경우, 해당 요소를 삭제
		
		double delValue = 45.6;
		
		if(v.contains(delValue)){ // 요소가 포함되어있는지 판단 
			v.remove(delValue);
		}
		
		System.out.println(v);
		
		
		// Stack 클래스
		// top에서만 데이터의 입출력 발생하기 때문.
		// LIFO 구조 (FILO 구조) : 먼저 들어온 데이터가 가장 마지막에 나감
		// 데이터 입력 -> push , 데이터 출력 -> pop
		
		// * 특정 자료구조의 형태로 처리했을 때 데이터 처리가 가장 효율적이다.
		Stack st = new Stack();
		
		st.push("1-JAVA");
		st.push("2-JSP");
		st.push("3-WEB");
		st.push("4-DB");
		
		while(!st.isEmpty()){ // 스택 클래스가 비어있지 않으면 (데이터 들어있으면)
			System.out.println(st.pop());
		}
		
		// 큐 (FIFO/LILO) : 먼저 들어온 데이터가 먼저 처리됨(순서대로)
		// 큐 (인터페이스) -> LinkedList (클래스) 
		
		Queue que = new LinkedList(); // 업캐스팅
		
		que.offer("1-JAVA");
		que.offer("2-JSP");
		que.offer("3-WEB");
		que.offer("4-DB");
		
		System.out.println("----------------------");
		
		while(que.peek() != null){ // 큐 안에 데이터가 있는지 없는지 판단, 없을 경우 null
			System.out.println(que.poll());
		}
		
		
		
		// Map(인터페이스) : ~Map, ~table 끝나는 자료구조 클래스
		// 데이터를 저장시 (키, 데이터) 쌍으로 저장해서 사용하는 구조
		// 키값을 사용해서 검색 인덱스 생성 -> 데이터 검색 시간이 짧음.
		
		Map m = new Hashtable(); // 업캐스팅	
		
		m.put("사과", "apple");
		m.put("오렌지", "orange");
		m.put("바나나", "banana");
		
		
		System.out.println(m.get("바나나"));
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
