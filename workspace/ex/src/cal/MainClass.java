package cal;

import java.util.Scanner;

public class MainClass {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		System.out.println("정수 두 개를 입력하시오 >>");
		double n1 = sc.nextDouble();
		double n2 = sc.nextDouble();
		System.out.println("연산자(+,-,*,/)를 입력하시오 >>");
		String a = sc.next();
        if (a.equals("+")) {
            System.out.println("결과는 " + n1 + " + " + n2 + " = " + (n1 + n2) + " 입니다.");
     } else if (a.equals("-")) {
            System.out.println("결과는 " + n1 + " - " + n2 + " = " + (n1 - n2) + " 입니다.");
     } else if (a.equals("*")) {
            System.out.println("결과는 " + n1 + " * " + n2 + " = " + (n1 * n2) + " 입니다.");
     } else if (a.equals("/")) {
            System.out.println("결과는 " + n1 + " / " + n2 + " = " + (n1 / n2) + " 입니다.");
     } else {
            System.out.println("잘못 입력하셨습니다. +, -, *, / 중 하나를 입력하세요.");
     }		
	}

}
