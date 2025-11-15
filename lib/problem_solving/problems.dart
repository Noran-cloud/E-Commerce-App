import 'dart:io';

void main() {
  ////////////////// 1
  List<int> n = [1, 2, 3, 2, 4, 1, 1, 5];
  List<int> freqArr = List.filled(6, 0);

  for (int i = 0; i < n.length; i++) {
    freqArr[n[i]]++;
  }
  print(n);
  print(freqArr.sublist(1));
  ///////////////////// 2
  String name = 'nouran';
  for (int i = name.length - 1; i >= 0; i--) {
    stdout.write(name[i]);
  }
  /////////////////// 3
  List<int> a = [1, 2, 3, 2, 4, 1, 1, 5];

  Set<int> s = a.toSet();
  for (int i = 0; i < a.length; i++) {
    if (s.contains(a[i]) == true) {
      s.remove(a[i]);
    } else {
      a.removeAt(i);
    }
  }
  
  print(a);

  //////////////////// 4
  List<int> b = [1, 2, 3, 2, 4, 1, 1, 5];
  b.sort();
  for (int i = 1; i < b.length; i++) {
    if (b[i] == b[i - 1]) b.remove(b[i]);
  }
  print('second large number: ${b[b.length - 2]}');

  ////////////////// 5
  List<int> c = [1, 2, 4, 5];
    for (int i = 1; i >= c.length+1; i++) {
      if (c.contains(i) == false) {
        print('missed number is : $i');
        break;
      }
    }
  
}
