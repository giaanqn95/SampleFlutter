import 'dart:math';
import 'package:flutter/material.dart';

class SampleKeyAndTypeKey extends StatefulWidget {
  @override
  _SampleKeyAndTypeKeyState createState() {
    return _SampleKeyAndTypeKeyState();
  }
}

class _SampleKeyAndTypeKeyState extends State<SampleKeyAndTypeKey> {
  var listTile = <Widget>[Tile(key: UniqueKey()), Tile(key: UniqueKey())]; // sửa dòng này

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: listTile,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTwoTileWidget,
        child: Icon(Icons.swap_horiz),
      ),
    );
  }


  void swapTwoTileWidget() {
    setState(() {
      listTile.insert(1, listTile.removeAt(0));
    });
  }
}

class Tile extends StatefulWidget {
  Tile({Key key}) : super(key: key); // thêm dòng này

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  final Color color = generateRandomColor();
  @override
  Widget build(BuildContext context) {

    return Container(
      color: color,
      width: 100,
      height: 100,
    );
  }
}


Color generateRandomColor() {

  final Random random = Random();


  return Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
}