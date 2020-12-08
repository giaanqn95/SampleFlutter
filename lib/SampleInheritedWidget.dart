import 'package:flutter/material.dart';

class SampleInheritedWidget extends StatefulWidget {
  @override
  SampleInheritedWidgetState createState() => SampleInheritedWidgetState();
}

class SampleInheritedWidgetState extends State<SampleInheritedWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // khởi tạo MyInheritedWidget tại vị trí cha của cả MyCenterWidget và MyText
      body: MyInheritedWidget(
        child: MyCenterWidget(), // child là sub tree từ MyCenterWidget xuống
        myData: counter, // data cần chia sẻ cho mấy widget child chính là counter
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

// thoải mái xóa hết constructor và data trong MyCenterWidget
class MyCenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyText(),
    );
  }
}

// thậm chí xóa luôn constructor và data khai báo trong MyText
class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Nhờ hàm MyInheritedWidget.of ta sẽ get được data
    // Bởi vì hàm of là hàm static nên ta có thể gọi ở bất cứ widget con nào ta muốn
    final counter = MyInheritedWidget.of(context).myData;

    // get được data thì update UI thôi :D
    return Text('Tui là widget Text. Data của tui hiện tại là: $counter');
  }
}

// tạo 1 InheritedWidget
class MyInheritedWidget extends InheritedWidget {
  MyInheritedWidget({Widget child, this.myData}) : super(child: child);

  // Chỗ này muốn tạo bao nhiêu data cũng được
  final int myData;
  // thích truyền MyHomePageState vào cũng được như thế này:
  // final MyHomePageState state;

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return false;
  }

  // mấy widget con sẽ gọi MyInheritedWidget.of(context) để truy cập được vào MyInheritedWidget lấy data
  static MyInheritedWidget of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}