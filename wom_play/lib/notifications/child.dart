import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wom_play/datos.dart';
import 'package:wom_play/user.dart';

class ChildNotifications extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _FInishLevelState();
}

class _FInishLevelState extends State<ChildNotifications>{

  @override
  Widget build(BuildContext context) {

    double height_screen = MediaQuery.of(context).size.height;
    double width_screen = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20)
            ),
          ),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Bienvenido, ${context.read<User>().nombre}!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: height_screen * 0.1,
                ),
                Image.asset(
                  "assets/images/feedback.png",
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10
                  ),
                  child: Text(
                    "Retroalimentación",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),
                  ),
                ),

                // Container(
                //   width: MediaQuery.of(context).size.width * 0.5,
                //   child: Text(
                //     widget.titleError,
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //         fontSize: 18,
                //         fontWeight: FontWeight.w500,
                //         color: Colors.grey[800]
                //     ),
                //   )
                // ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800]
                      ),
                    )
                )
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          // height: 70.0,
          // color: Colors.grey[50],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  "Aquí recibirás consejos para que puedas aprender más.",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800]
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }


}