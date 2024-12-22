/*
  Viet chuong trinh chuyen doi 1 so nguyen(n>=1) 
  duoc nhap tu ban phim thanh so nhi phan
*/
import 'dart:io';
import 'dart:math';

void main(){
  int n = 0;

  //Input n
   do{
    stdout.write('Nhap so nguyen n (n lon hon hoac bang 1): ');
    String? input = stdin.readLineSync();
    if(input!=null){
      n = int.tryParse(input) ?? 0;
    }
    if(n<1){
      print('Vui long nhap lai n: ');
    }
  }while(n<1);

  //CHuyen doi nhi phan
  String binary = n.toRadixString(2);
  print('So nhi phan được chuyển hóa từ ${n} là: $binary');
}