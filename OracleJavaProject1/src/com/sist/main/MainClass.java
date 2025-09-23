package com.sist.main;
import java.util.*;
import com.sist.dao.*;
/*
 *     JSP (main에서 코딩)
 *      =========> DAO
 *        Model 1 방식
 *      
 *     JSP <===== Model <=====> DAO
 *        Model 2 방식 => MVC 구조 (Spring, Spring-Boot)
 */
public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        // DAO객체 생성 => JSP / Model
		
		TestDAO dao = TestDAO.newInstance();
		Scanner scan = new Scanner(System.in);
		System.out.println("카테고리 선택(주소(1), 종류(2), 업체명(3) : ");
		int type = scan.nextInt();
		System.out.print("검색어 입력 : ");
		String fd = scan.next();
		String[] ss= {"","address", "type","name"};
		long start = System.currentTimeMillis();
		List<String> list = dao.foodFindData(ss[type], fd);
		long end = System.currentTimeMillis();
		System.out.println("걸린 시간 : " +(end-start));
		for(String s:list) {
			System.out.println(s);
		}
	}

}
