void main(){
    Object obj ='hello';

    if(obj is String){
        print('obj is String');
    }

    if(obj is! int){
        print('obj khong phai la int');
    }

    String str = obj as String;
    print(str.toUpperCase());
}