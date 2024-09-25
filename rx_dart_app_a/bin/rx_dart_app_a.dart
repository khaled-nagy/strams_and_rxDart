import 'package:rx_dart_app_a/rx_dart_app_a.dart' as rx_dart_app_a;
import 'package:rxdart/rxdart.dart';

void main() {
  final behaviorSubject = BehaviorSubject<int>();
  // listen to the stream 
  behaviorSubject.listen((value) => print('Listener 1: $value'));
  // add some data to the stream
  behaviorSubject.add(1);
  behaviorSubject.add(2);
  // listen again (this listen will immediatly receive the last value)
  behaviorSubject.listen((value) => print('Listener 2: $value'),);
  // close the subject when done
  behaviorSubject.close();

}
