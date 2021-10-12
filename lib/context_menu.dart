import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class contextMenu extends StatefulWidget {
  const contextMenu({Key? key}) : super(key: key);

  @override
  _contextMenuState createState() => _contextMenuState();
}

class _contextMenuState extends State<contextMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      child: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: CupertinoContextMenu(
            child: Image.network(
                'https://i.pinimg.com/originals/47/a2/83/47a283c6bbb9c3f8f6c2390ad64e1522.jpg'),
            actions: [
              CupertinoContextMenuAction(
                child: Text('Download'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoContextMenuAction(
                child: Text('Share'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
