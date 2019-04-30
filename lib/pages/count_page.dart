import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int initialCount = 0;
  BehaviorSubject<int> _subjectCount;
  
  CounterBloc({this.initialCount}) {
    _subjectCount = BehaviorSubject.seeded(this.initialCount);
  }

  Observable<int> get counterObservable => _subjectCount.stream;

  void increment() {
    initialCount++;
    _subjectCount.sink.add(initialCount);
  }
  
  void decremnt() {
    initialCount--;
    _subjectCount.sink.add(initialCount);
  }

  void dispose() {
    _subjectCount.close();
  }
}

class CountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountPage();
}

class _CountPage extends State<CountPage> {
  CounterBloc _bloc = CounterBloc(initialCount: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You hav pushed the button this many times:'),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.display1,
            // )
            StreamBuilder(stream: _bloc.counterObservable, builder: (context, AsyncSnapshot<int> snapshot) {
              return Text('${snapshot.data}', style: Theme.of(context).textTheme.display1,);
            },)
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              tooltip: 'increment',
              onPressed: _bloc.increment,
            ),
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            tooltip: 'decrement',
            onPressed: _bloc.decremnt,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
