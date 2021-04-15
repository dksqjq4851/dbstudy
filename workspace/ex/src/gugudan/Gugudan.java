package gugudan;

import java.util.Scanner;

public class Gugudan {

	public static void gugudan(int dan) {
		Scanner sc = new Scanner(System.in);
		System.out.println("구구단의 단을 입력하시오.");
		dan = sc.nextInt();
		System.out.println("<" + dan + "단 >");
		for (int i = 1; i<9; i++) {
	
			System.out.println(dan + "x" + i + "=" + (dan * i));
			
		}
		
		
		
	}
}
