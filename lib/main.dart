import 'package:flutter/material.dart';

import 'SampleBugWithGlobalKey.dart';
import 'SampleInheritedWidget.dart';
import 'SampleKeyAndTypeKey.dart';
import 'SampleSetStateWithStatefulWidget.dart';
import 'SampleSetStateWithStatelessWidget.dart';
import 'SampleSnackBar.dart';
import 'SampleWithBloc.dart';
import 'SampleWithGlobalAndTFF.dart';
import 'TestUpdateCountWithBloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        childWidget: MyCenterWidget(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.childWidget});

  final Widget childWidget;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print('1. hàm build được gọi do hàm setState được gọi');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              textColor: Colors.white,
              color: Color(0xFF6200EE),
              onPressed: navigateToSampleBugWithGlobalKey,
              child: Text('Sample Bug With GlobalKey'),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Color(0xFF6200EE),
              onPressed: navigateToInheritedWidget,
              child: Text('Sample Inherited Widget'),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Color(0xFF6200EE),
              onPressed: navigateToSampleKeyAndTypeKey,
              child: Text('Sample about key and type Key'),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Color(0xFF6200EE),
              onPressed: navigateToSampleSetStateWithStatefulWidget,
              child: Text('Sample set state with StatefulWidget'),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Color(0xFF6200EE),
              onPressed: navigateToSampleSetStateWithStatefulWidget,
              child: Text('Sample set state with StatelessWidget'),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Color(0xFF6200EE),
              onPressed: navigateToSampleSnackBar,
              child: Text('Sample with snack bar'),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Color(0xFF6200EE),
              onPressed: navigateToSampleWithBlocPattern,
              child: Text('Sample with SampleWithBlocPattern'),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Color(0xFF6200EE),
              onPressed: navigateToSampleWithGlobalAndTFF,
              child: Text('Sample with navigateToSampleWithGlobalAndTFF'),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Color(0xFF6200EE),
              onPressed: navigateToTestUpdateCountWithBloc,
              child: Text('Sample with TestUpdateCountWithBloc'),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSampleBugWithGlobalKey() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => SampleBugWithGlobalKey()));
  }

  void navigateToInheritedWidget() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => SampleInheritedWidget()));
  }

  void navigateToSampleKeyAndTypeKey() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => SampleKeyAndTypeKey()));
  }

  void navigateToSampleSetStateWithStatefulWidget() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => SampleSetStateWithStatefulWidget(title: "test ne",)));
  }

  void navigateToSampleSetStateWithStatelessWidget() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => SampleSetStateWithStatelessWidget()));
  }

  void navigateToSampleSnackBar() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => WidgetSnackBar()));
  }

  void navigateToSampleWithBlocPattern() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => SampleWithBlocPattern()));
  }

  void navigateToSampleWithGlobalAndTFF() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => SampleWithGlobalAndTFF()));
  }

  void navigateToTestUpdateCountWithBloc() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => TestUpdateCountWithBloc()));
  }
}
