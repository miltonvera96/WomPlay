import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wom_play/user.dart';

class FinishLevel extends StatefulWidget{

  String level;
  FinishLevel(this.level);

  @override
  State<StatefulWidget> createState() => _FInishLevelState();
}

class _FInishLevelState extends State<FinishLevel>{
  @override
  Widget build(BuildContext context) {

    double height_screen = MediaQuery.of(context).size.height;
    double width_screen = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //
          Expanded(
            child: Column(
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
                          "Bien hecho, \n${context.read<User>().nombre}!",
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
                        Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                "assets/images/girl.png",
                                height: MediaQuery.of(context).size.height * 0.25,
                              ),
                            ),
                            Center(
                              child: Image.asset(
                                "assets/images/party.png",
                                height: MediaQuery.of(context).size.height * 0.25,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10
                          ),
                          child: Text(
                            "${widget.level} completado!",
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
                  width: MediaQuery.of(context).size.width * 0.7,
                  // height: 70.0,
                  // color: Colors.grey[50],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          "Sigue entrenando más en los siguientes niveles",
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
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8.0, vertical: 10.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius:
                      new BorderRadius.circular(20.0)),
                  color: Colors.blue[800],
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Salir",
                    style: TextStyle(
                        fontSize: 18, color: Colors.white),
                  )),
            ),
          ),

        ],
      ),
    );
  }

}