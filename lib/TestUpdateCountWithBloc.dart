import 'dart:async';
import 'package:flutter/material.dart';

class TestUpdateCountWithBloc extends StatelessWidget {
  final bloc = MyBlocCount();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<MyStateCount>(
            stream: bloc.stateController.stream,
            initialData: bloc.myState,
            builder: (context, snapshot) {
              return Text(
                  'Tui là widget Text with Bloc. Data của tui hiện tại là: ${snapshot.data.count}');
            },
          ),
          RaisedButton(
            textColor: Colors.white,
            color: Color(0xFF6200EE),
            onPressed: () {
              swapTwoTileWidget(context, bloc);
            },
            child: Text('Chuyen man hinh'),
          ),
        ],
      )),
    );
  }

  void swapTwoTileWidget(BuildContext context, MyBlocCount bloc) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => AnotherScreens(bloc: bloc)));
  }
}

class GetBlocCount {
  static final bloc = MyBlocCount();

  static MyBlocCount getBlocCount() {
    if (bloc == null) return MyBlocCount();
    return bloc;
  }
}

abstract class MyEventCount {}

class EventCount extends MyEventCount {}

class MyStateCount {
  MyStateCount(this.count);

  int count;
}

class MyBlocCount {
  var myState = MyStateCount(0);

  final eventController = StreamController<MyEventCount>();
  final stateController = StreamController<MyStateCount>.broadcast();

  MyBlocCount() {
    eventController.stream.listen((event) {
      if (event is EventCount) {
        myState.count++;
        stateController.sink.add(MyStateCount(myState.count));
      }
    });
  }

  void dispose() {
    eventController.close();
    stateController.close();
  }
}

class AnotherScreens extends StatelessWidget {
  AnotherScreens({this.bloc});
  final MyBlocCount bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          textColor: Colors.white,
          color: Color(0xFF6200EE),
          onPressed: clickCount,
          child: Text('Count ne'),
        ),
      ),
    );
  }

  void clickCount() {
    bloc.eventController.add(EventCount());
  }
}
