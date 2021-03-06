import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'SampleBugWithGlobalKey.dart';
import 'SampleCallApi.dart';
import 'SampleInheritedWidget.dart';
import 'SampleKeyAndTypeKey.dart';
import 'SampleListView.dart';
import 'SampleListView2.dart';
import 'SampleListView3.dart';
import 'SampleSetStateWithStatefulWidget.dart';
import 'SampleSetStateWithStatelessWidget.dart';
import 'SampleSnackBar.dart';
import 'SampleWithBloc.dart';
import 'SampleWithGlobalAndTFF.dart';
import 'TestUpdateCountWithBloc.dart';
import 'base_client/TestWidgetProperty.dart';
import 'base_client/bloc/BlocRepository.dart';

void main() {
  final BlocProvider<RequestBloc> blocProvider = BlocProvider<RequestBloc>(
    create: (context) => RequestBloc(),
    child: MyApp(),
  );
  runApp(blocProvider);
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
        child: ListView(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 30,bottom: 10),
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
            RaisedButton(
              textColor: Colors.white,
              color: Color(0xFF6200EE),
              onPressed: navigateToSampleCallAPi,
              child: Text('Sample with SampleCallAPi'),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Color(0xFF6200EE),
              onPressed: navigateToSampleListView,
              child: Text('Sample with ListView'),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Color(0xFF6200EE),
              onPressed: navigateToSampleListView2,
              child: Text('Sample with ListView2'),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Color(0xFF6200EE),
              onPressed: navigateToSampleListView3,
              child: Text('Sample with ListView3'),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Color(0xFF6200EE),
              onPressed: navigateToTestWidgetProperty,
              child: Text('Sample with Test Widget Property'),
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
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => SampleSetStateWithStatefulWidget(
              title: "test ne",
            )));
  }

  void navigateToSampleSetStateWithStatelessWidget() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => SampleSetStateWithStatelessWidget()));
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

  void navigateToSampleCallAPi() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => SampleCallApi()));
  }

  void navigateToSampleListView() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => SampleListView()));
  }

  void navigateToSampleListView2() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => SampleListView2()));
  }

  void navigateToSampleListView3() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => SampleListView3()));
  }

  void navigateToTestWidgetProperty() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => TestWidgetProperty()));
  }

  @override
  void initState() {
    BlocProvider.of<RequestBloc>(context);
  }
}
