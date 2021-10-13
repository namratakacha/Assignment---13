import 'package:assignm_13/segment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<Widget> _tabs = [Tab1(), Tab2()];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Image'),
            BottomNavigationBarItem(
                icon: Icon(Icons.text_fields), label: 'Text field')
          ],
        ),
        tabBuilder: (BuildContext context, index) {
          return _tabs[index];
        });
  }
}

//Tab 1
class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  bool isSelected = false;
  bool _active1 = false;
  bool _active2 = false;
  bool _active3 = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.activeBlue,
          middle: Text(
            'Cupertino widgets',
            style: TextStyle(
                fontSize: 30,
                color: CupertinoColors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        child: Container(
          child: Column(
            children: [
              Card(
                  margin: EdgeInsets.all(10),
                  elevation: 16,
                  child: Column(
                    children: [
                      Image.network(
                          'https://images.indianexpress.com/2020/03/classroom.jpg'),
                      Padding(padding: EdgeInsets.all(10)),
                      CupertinoButton(
                        child: Row(
                          children: [
                            Icon(
                              Icons.emoji_emotions_sharp,
                              color:
                                  isSelected ? Colors.yellow[600] : Colors.grey,
                            ),
                            Text('Like',
                                style: TextStyle(
                                    color:
                                        isSelected ? Colors.red : Colors.grey))
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                      ),
                    ],
                  )),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Do you like E-learning'),
                        CupertinoSwitch(
                          value: _active1,
                          onChanged: (bool value) {
                            setState(() {
                              _active1 = !_active1;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('do you ever gone through E-learning'),
                        CupertinoSwitch(
                          value: _active2,
                          onChanged: (bool value) {
                            setState(() {
                              _active2 = !_active2;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Is E-learning helpfull'),
                        CupertinoSwitch(
                          value: _active3,
                          onChanged: (bool value) {
                            setState(() {
                              _active3 = !_active3;
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

//Tab 2
class Tab2 extends StatefulWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailctrl = TextEditingController();
  TextEditingController _pwdctrl = TextEditingController();
  TextEditingController _mobilectrl = TextEditingController();

  onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      showCupertinoDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text('Done'),
                content: Text('Successfully Registerd'),
                actions: [
                  CupertinoDialogAction(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Segment()));
                      }),
                ],
              ));
    }
    ;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailctrl.dispose();
    _pwdctrl.dispose();
    _mobilectrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.activeBlue,
          middle: Text(
            'Cupertino text field',
            style: TextStyle(
                fontSize: 30,
                color: CupertinoColors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Registration Form',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  'Enter details',
                  style: TextStyle(fontSize: 22),
                ),
                CupertinoTextFormFieldRow(
                  controller: _emailctrl,
                  validator: (String? v) {
                    if ((v ?? '').isEmpty) {
                      return 'Please Enter Email';
                    }
                  },
                  textInputAction: TextInputAction.next,
                  padding: EdgeInsets.all(10),
                  keyboardType: TextInputType.emailAddress,
                  placeholder: 'Email',
                  prefix: CupertinoButton(
                      child: Icon(
                        CupertinoIcons.mail_solid,
                        color: CupertinoColors.activeBlue,
                      ),
                      onPressed: () {}),
                  decoration: BoxDecoration(
                    color: CupertinoColors.lightBackgroundGray,
                    border: Border.all(
                      color: CupertinoColors.black,
                    ),
                  ),
                ),
                CupertinoTextFormFieldRow(
                  controller: _mobilectrl,
                  validator: (String? v) {
                    if ((v ?? '').isEmpty) {
                      return 'Please Enter Mobile Number';
                    }
                  },
                  textInputAction: TextInputAction.next,
                  padding: EdgeInsets.all(10),
                  placeholder: 'Mobile Number',
                  keyboardType: TextInputType.number,
                  prefix: CupertinoButton(
                      child: Icon(
                        CupertinoIcons.phone_circle_fill,
                        color: CupertinoColors.activeBlue,
                      ),
                      onPressed: () {}),
                  decoration: BoxDecoration(
                    color: CupertinoColors.lightBackgroundGray,
                    border: Border.all(
                      color: CupertinoColors.black,
                    ),
                  ),
                ),
                CupertinoTextFormFieldRow(
                  controller: _pwdctrl,
                  maxLength: 8,
                  validator: (String? v) {
                    if ((v ?? '').isEmpty) {
                      return 'Please Enter Password';
                    }
                  },
                  textInputAction: TextInputAction.done,
                  padding: EdgeInsets.all(10),
                  placeholder: 'Password',
                  obscureText: true,
                  prefix: CupertinoButton(
                      child: Icon(
                        CupertinoIcons.lock_fill,
                        color: CupertinoColors.activeBlue,
                      ),
                      onPressed: () {}),
                  decoration: BoxDecoration(
                    color: CupertinoColors.lightBackgroundGray,
                    border: Border.all(
                      color: CupertinoColors.black,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                CupertinoButton(
                  child: Text('SUBMIT'),
                  borderRadius: BorderRadius.circular(30),
                  color: CupertinoColors.activeBlue,
                  onPressed: () {
                    onSubmit();
                  },
                )
              ],
            )));
  }
}
