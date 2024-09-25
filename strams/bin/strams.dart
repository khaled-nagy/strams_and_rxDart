import 'dart:async';
import 'dart:isolate';

import 'package:strams/strams.dart' as strams;
  final StreamController<int> streamController = StreamController<int>(); 

void heavyTask(SendPort sendPort) {
  // بعد إنهاء المهمة نرسل النتيجة إلى الـ main isolate
  sendPort.send("تمت المهمة بنجاح!");
}
void main() async{
  ReceivePort receivePort = ReceivePort();
  await Isolate.spawn(heavyTask, receivePort.sendPort);
  receivePort.listen((message){
    print("الرسالة المستلمة: $message");
  });

for (var i = 1; i <= 10; i++) {
  streamController.add(i);
}
  print('Hello world: ${strams.calculate()}!');
 streamController.stream.where((number)=> number % 2 == 0 ).map((number)=> 'Number is $number').listen((data){
  print(data);
 });

  streamController.close();


}
