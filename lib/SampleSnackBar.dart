import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_client/bloc/BlocRepository.dart';



class SampleSnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold đang là cha của MyButtonWidget
      body: Center(
        child: WidgetSnackBar(),
      ),
    );
  }
}

class WidgetSnackBar extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>(); // <=== dòng này

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey, // <=== dòng này
      body: Center(
        child: FlatButton(
          child: Text('show snackbar'),
          color: Colors.pink,
          onPressed: () {
            final snackBar = SnackBar(content: Text('Không thể truy cập bài viết này vì thấy hay mà không vote'));
            // scaffoldKey.currentState.showSnackBar(snackBar); // <=== dòng này
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    );
  }
}

// Nếu không chia widget thì có thể dùng Builder để tạo context
// class SampleSnackBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Builder( // widget Builder wrap widget FlatButton
//           // sử dụng thuộc tính builder
//           // truyền vào 1 biến hàm có type: Widget Function(BuildContext context)
//           builder: (context) => FlatButton(
//             child: Text('show snackbar'),
//             color: Colors.pink,
//             onPressed: () {
//               final snackBar = SnackBar(content: Text('Lỗi không thể truy cập bài viết này vì thấy hay mà không vote'));
//               Scaffold.of(context).showSnackBar(snackBar);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }