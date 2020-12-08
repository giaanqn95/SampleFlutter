
import 'package:flutter/material.dart';

class SampleSetStateWithStatefulWidget extends StatefulWidget {
  SampleSetStateWithStatefulWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SampleSetStateWithStatefulWidgetState createState() {
    print('MyHomePage createState');
    return _SampleSetStateWithStatefulWidgetState();
  }

  @override
  StatefulElement createElement() {
    print('MyHomePage createElement');
    return super.createElement();
  }
}

class _SampleSetStateWithStatefulWidgetState extends State<SampleSetStateWithStatefulWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('MyHomePage build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _counter % 2 == 0
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            MyText(counter: _counter),
          ],
        )
            : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              MyText(counter: _counter),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({
    Key key,
    @required int counter,
  })  : _counter = counter,
        super(key: key);

  final int _counter;

  @override
  Widget build(BuildContext context) {
    print('MyText build');
    return Text(
      '$_counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }

  @override
  StatelessElement createElement() {
    print('MyText createElement');
    return super.createElement();
  }
}
