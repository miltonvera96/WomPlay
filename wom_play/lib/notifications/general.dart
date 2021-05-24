import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wom_play/datos.dart';
import 'package:wom_play/notifications/child.dart';
import 'package:wom_play/notifications/father.dart';
import 'package:wom_play/user.dart';

class GeneralNotifications extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _GeneralNotificationsState();
}

class _GeneralNotificationsState extends State<GeneralNotifications>{

  int tipo_selected= 2;
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            tipo_selected == 1?
                FatherNotifications():
                ChildNotifications(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height *0.10,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(0.90),
                        Colors.white54,
                        Colors.white.withOpacity(0.0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter
                  ),
                ),
                child: Center(
                    child: CupertinoSegmentedControl(
                        selectedColor: Color(0xff004e94),
                        borderColor: Color(0xff004e94),
                        groupValue: tipo_selected,
                        children: {
                          1: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width * 0.1,
                                vertical: 5
                            ),
                            child: Text("Padre"),
                          ),
                          2: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width * 0.1,
                                vertical: 5
                            ),
                            child: Text("Niño"),
                          ),
                        },
                        onValueChanged: (value){
                          setState(() {
                            tipo_selected = value;
                          });
                        }
                    )
                ),
              ),
            )
          ],
        )
    );
  }

}