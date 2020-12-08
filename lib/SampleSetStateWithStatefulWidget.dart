import 'package:flutter/material.dart';

class SampleSetStateWithStatelessWidget extends StatefulWidget {
  @override
  SampleSetStateWithStatelessWidgetState createState() => SampleSetStateWithStatelessWidgetState();
}

class SampleSetStateWithStatelessWidgetState extends State<SampleSetStateWithStatelessWidget> {
  int counter = 0; // Data của Widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyText(counter: counter),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// Extract widget Text ra được 1 StatefulWidget
class MyText extends StatefulWidget {
  const MyText({this.counter});

  final int counter;

  @override
  _MyTextState createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    return Text('Tui là widget Text. Data của tui hiện tại là: ${widget.counter}');
  }
}