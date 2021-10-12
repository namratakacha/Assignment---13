import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PickDate extends StatefulWidget {
  PickDate({Key? key}) : super(key: key);

  @override
  _PickDateState createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        //color: Colors.red,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$selectedDate'.split(' ')[0],
              style: TextStyle(fontSize: 20),
            ),
            CupertinoButton(
              child: Text('Select date'),
              onPressed: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 250,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: [
                                  CupertinoButton(
                                    child: Text('Done'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      if (selectedDate != null) {
                                        setState(() {
                                          selectedDate = selectedDate;
                                        });
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              height: 0,
                              thickness: 1,
                            ),
                            Expanded(
                              child: Container(
                                child: CupertinoDatePicker(
                                  initialDateTime: selectedDate,
                                  mode: CupertinoDatePickerMode.date,
                                  minimumDate: DateTime(1990),
                                  maximumDate: DateTime(2025),
                                  onDateTimeChanged: (DateTime dateTime) {
                                    selectedDate = dateTime;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }

  // _openDatePicker(BuildContext context) async {
  //   DateTime pickedDate = await showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return Container(
  //         height: 250,
  //         child: Column(
  //           children: <Widget>[
  //             Container(
  //               child: Row(
  //                 children: [
  //                   CupertinoButton(
  //                     child: Text('Done'),
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                   )
  //                 ],
  //               ),
  //             ),
  //             Divider(
  //               height: 0,
  //               thickness: 1,
  //             ),
  //             Expanded(
  //               child: Container(
  //                 child: CupertinoDatePicker(
  //                   mode: CupertinoDatePickerMode.date,
  //                   minimumDate: DateTime(1990),
  //                   maximumDate: DateTime(2025),
  //                   onDateTimeChanged: (DateTime dateTime) {
  //                     selectedDate = dateTime;
  //                   },
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //  },
  //  );

}
