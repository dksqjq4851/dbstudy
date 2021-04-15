package array;

public class Array {
	
	public static void makeArray() {
		int[] a = new int[5];
		for(int i = 0; i<a.length;i++) {
			a[i] = i+1;
		}
	}
	public static void printArray(int[] arr) {
		for(int i : arr) {
			System.out.println(i);
		}
	}
	public static void sumArray(int[] arr) {
		int sum = 0;
		for(int i= 0; i<arr.length;i++) {
			sum += arr[i];
		}
	}

}
