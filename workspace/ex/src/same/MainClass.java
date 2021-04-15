package same;

import java.util.Scanner;

public class MainClass {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("두자리 정수를 입력하시오 >>");
		int a = sc.nextInt();
		if((a%10) == (a/10)) {
			System.out.println(a + "는 일의 자리와 십의 자리가 일치함");
		}else {
			System.out.println(a + "는 일의 자리와 십의 자리가 일치하지않음");
		}

	}

}
