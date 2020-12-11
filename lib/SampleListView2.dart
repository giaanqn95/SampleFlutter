import 'package:flutter/material.dart';

class SampleListView2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SampleListViewState2();
}

class SampleListViewState2 extends State<SampleListView2> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            if (index.isOdd) return Divider();
            return GestureDetector(
              onTap: () => {print("Clicked item ${entries[index]}")},
              child: Container(
                height: 50,
                child: Text(
                  'Entry ${entries[index]}',
                  textAlign: TextAlign.center,
                ),
                color: Colors.amber[colorCodes[index]],
              ),
            );
          }),
    );
    //return ListView.separated(
    //   padding: const EdgeInsets.all(8),
    //   itemCount: entries.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       height: 50,
    //       color: Colors.amber[colorCodes[index]],
    //       child: Center(child: Text('Entry ${entries[index]}')),
    //     );
    //   },
    //   separatorBuilder: (BuildContext context, int index) => const Divider(),
    // );
  }
}
