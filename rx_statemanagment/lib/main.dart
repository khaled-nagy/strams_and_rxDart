import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(MyApp());

class CounterBloc {
  // إنشاء BehaviorSubject لإدارة حالة العداد
  final _counterSubject = BehaviorSubject<int>.seeded(0);

  // دفق يعرض قيمة العداد
  Stream<int> get counterStream => _counterSubject.stream;

  // دالة لزيادة العداد
  void increment() {
    final currentCount = _counterSubject.value;
    _counterSubject.add(currentCount + 1);
  }

  // إغلاق ال BehaviorSubject عند عدم الحاجة
  void dispose() {
    _counterSubject.close();
  }
}

class MyApp extends StatelessWidget {
  final CounterBloc _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("RxDart Counter Example"),
        ),
        body: StreamBuilder<int>(
          stream: _bloc.counterStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Text(
                  'Count: ${snapshot.data}',
                  style: TextStyle(fontSize: 30),
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _bloc.increment,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
