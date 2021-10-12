import 'package:assignm_13/tab_bar/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myList = List.generate(20, (index) => 'Item $index');
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            trailing: Material(
                child: IconButton(
              icon: Icon(Icons.arrow_forward_ios_sharp),
              onPressed: () {
                showCupertinoDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                          title: Text('Alert',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: CupertinoColors.activeBlue)),
                          content: Text('Are you sure to go to next page',
                              style: TextStyle(fontSize: 16)),
                          actions: [
                            CupertinoDialogAction(
                              child: Text('Yes'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Tabs()));
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text('No'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ));
              },
            )),
            middle: Text('Cupertino widgets', style: TextStyle(fontSize: 26)),
            leading: Material(
              child: IconButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => CupertinoActionSheet(
                            title: Text(
                              'Choose options',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            message: Text('Your options are'),
                            actions: [
                              CupertinoActionSheetAction(
                                child: Text('Item 1'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              CupertinoActionSheetAction(
                                child: const Text('Item 2'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              CupertinoActionSheetAction(
                                child: const Text('Item 3'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                            cancelButton: CupertinoActionSheetAction(
                              child: Text('Cancel'),
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context, 'Cancel');
                              },
                            )));
                  },
                  icon: Icon(Icons.add)),
            ),
            largeTitle: Text(
              'Sliver Navigation Bar',
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Card(
                elevation: 16,
                margin: const EdgeInsets.all(15),
                child: Container(
                  color: Colors.blue[100 * (index % 9 + 1)],
                  height: 90,
                  alignment: Alignment.center,
                  child: Text(
                    "Item $index",
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              );
            }, childCount: 20),
            // ),
          ),
        ],
      ),
    );

    // CupertinoScrollbar(
    //       isAlwaysShown: true,
    //       thickness: 10,
    //       thicknessWhileDragging: 20,
    //       radius: Radius.circular(20),
    //       child: ListView.builder(
    //           itemCount: _myList.length,
    //           itemBuilder: (context, index) => Card(
    //                 key: ValueKey(_myList[index]),
    //                 margin: EdgeInsets.all(15),
    //                 elevation: 8,
    //                 child: ListTile(
    //                   title: Text(
    //                     _myList[index],
    //                     style: TextStyle(fontSize: 24),
    //                   ),
    //                 ),
    //               )))
  }
}
