import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingOverlay {
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show() {
    showDialog(
        context: _context,
        barrierDismissible: false,
        child: _FullScreenLoader());
  }

  Future<T> during<T>(int timeCount) {
    show();
    return Future.delayed(Duration(seconds: timeCount), () {
        hide();
    });
  }

  void coolddownProgress(int timeCount) {
    show();
    Timer(Duration(seconds: timeCount), () {
      hide();
    });
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
        child: Center(child: CircularProgressIndicator()));
  }
}
