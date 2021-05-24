import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wom_play/account/profilepage.dart';
import 'package:wom_play/home/initpage.dart';
import 'package:wom_play/home/skillspage.dart';
import 'package:wom_play/account/register.dart';
import 'package:wom_play/notifications/father.dart';
import 'package:wom_play/notifications/general.dart';


class TabsPage extends StatefulWidget {
  TabsPage({Key key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {

  static List<Widget> screens = <Widget>[
    SkillsPage(),
    Profile(),
    GeneralNotifications(),
    Center()
  ];

  int tab_selected = 0;

  List<IconData> tabs = [
    Icons.home_filled,
    Icons.person,
    Icons.notifications,
    // Icons.settings
  ];

  CupertinoTabController controller = CupertinoTabController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: IndexedStack(
              index: tab_selected,
              children: screens,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                bottom: 10
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      tabs.length, (index) => buildTab(tabs[index], index)
                  )
              ),
            ),
          )
        ],
      ),

    );
  }

  buildTab(IconData icon, int index){
    return  GestureDetector(
        onTap: (){
          setState(() {
            tab_selected = index;
          });
        },
        child: Container(
          height: MediaQuery.of(context).size.width * 0.12,
          width: MediaQuery.of(context).size.width * 0.12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Container(
            color: tab_selected == index ? Colors.white.withOpacity(0.05) : Colors.white,
            child: Icon(
              icon,
              color: tab_selected == index ? Color(0xff004e94) : Colors.grey[400],
              size: 30,
            ),
          )
        )
    );
  }

}

