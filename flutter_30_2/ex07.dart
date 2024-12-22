/*
  Viết chương trình tính tổng các ước số của 1 số nguyên (n>=1)
*/
import 'dart:io';
void main() {
  // Nhập số nguyên từ người dùng
  print('Nhập một số nguyên dương n (n >= 1):');
  int n = int.parse(stdin.readLineSync()!);

  if (n < 1) {
    print('Vui lòng nhập một số nguyên dương lớn hơn hoặc bằng 1.');
    return;
  }

  int sumOfDivisors = 0;

  // Tìm các ước số và tính tổng
  for (int i = 1; i <= n; i++) {
    if (n % i == 0) {
      sumOfDivisors += i;
    }
  }

  print('Tổng các ước số của $n là: $sumOfDivisors');
}