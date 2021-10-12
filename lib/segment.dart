import 'package:assignm_13/context_menu.dart';
import 'package:assignm_13/date_time.dart';
import 'package:assignm_13/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Segment extends StatefulWidget {
  const Segment({Key? key}) : super(key: key);

  @override
  _SegmentState createState() => _SegmentState();
}

class _SegmentState extends State<Segment> {
  //int groupValue = 0;
  final Map<int, Widget> segmentWidgets = const <int, Widget>{
    0: Text('Date Picker'),
    1: Text('Context Menu'),
    2: Text('Search'),
  };

  final Map<int, Widget> screens = <int, Widget>{
    0: Container(child: PickDate()),
    1: Container(child: contextMenu()),
    2: Container(
      child: searchBar(),
    )
  };

  int sharedValue = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Cupertino Segment Control',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: CupertinoColors.activeBlue,
      ),
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
          ),
          SizedBox(
            width: 500.0,
            child: CupertinoSegmentedControl<int>(
              children: segmentWidgets,
              onValueChanged: (int val) {
                setState(() {
                  sharedValue = val;
                });
              },
              groupValue: sharedValue,
            ),
          ),
          Expanded(
              child: Container(
            child: screens[sharedValue],
          ))
        ],
      ),
    );
  }
}
