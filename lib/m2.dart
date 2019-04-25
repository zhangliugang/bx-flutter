import 'dart:async';
import 'package:rxdart/rxdart.dart';

void main (){
  ReplaySubject<int> subject = new ReplaySubject();

  subject.stream.listen(print);
  subject.add(1);
  subject.add(2);
subject.add(3);
  subject.stream.listen(print);
  
}