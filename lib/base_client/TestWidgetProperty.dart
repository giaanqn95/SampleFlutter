import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../SampleKeyAndTypeKey.dart';

class TestWidgetProperty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(color: generateRandomColor(), width: 50, height: 50),
                Container(color: generateRandomColor(), width: 50, height: 50),
                Container(color: generateRandomColor(), width: 50, height: 50),
                Container(color: generateRandomColor(), width: 50, height: 50),
                Container(color: generateRandomColor(), width: 50, height: 50),
              ],
            ),
        )
    );
  }
}
