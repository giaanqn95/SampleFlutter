import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../SampleKeyAndTypeKey.dart';

class TestWidgetProperty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,

      children: [
        Container(color: generateWhite(), width: 50, height: 50),
        Container(color: generateWhite(), width: 50, height: 50),
        Container(color: generateWhite(), width: 50, height: 50),
        Container(color: generateWhite(), width: 50, height: 50),
        Container(color: generateWhite(), width: 50, height: 50),
      ],
    );
  }
}
