import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wom_play/home/skillspage.dart';
import 'package:wom_play/home/tabs.dart';
import 'package:wom_play/account/register.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {

    double height_screen = MediaQuery.of(context).size.height;
    double width_screen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: height_screen*0.55,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Color(0xff004e94),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40)
              )
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: width_screen*0.5,
              width: width_screen*0.5,
              decoration: BoxDecoration(
                  color: Color(0xff50bfa5),
                  shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  height: width_screen*0.25,
                  width: width_screen*0.25,
                  decoration: BoxDecoration(
                    color: Color(0xffcff4d2),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: height_screen*0.1,
            child: Image.asset(
              "assets/images/children.png",
              height: height_screen*0.4,
              width: width_screen,
              fit: BoxFit.fitHeight,
              alignment: Alignment.center,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height_screen*0.4,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "WOM! Play",
                    style: GoogleFonts.fredokaOne(
                        fontWeight: FontWeight.w700,
                        fontSize: height_screen*0.05,
                        color: Colors.black
                    ),
                  ),
                  Text(
                    "Entrena habilidades suaves\n"
                        "de manera divertida",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                        fontSize: height_screen*0.02,
                        color: Colors.grey[600]
                    ),
                  ),
                  GestureDetector(
                    onTap: (){

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return Registrar();
                          }));
                    },
                    child: Container(
                        height: height_screen * 0.05,
                        width: width_screen * 0.7,
                        decoration: BoxDecoration(
                            color: Color(0xff004e94),
                            borderRadius: BorderRadius.circular(
                                height_screen * 0.05
                            ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              spreadRadius: 0
                            )
                          ]
                        ),
                        child: Center(
                          child: Text(
                            "Iniciar",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.white
                            ),
                          ),
                        )
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: height_screen*0.3,
            right: -50,
            child: Image.asset(
              "assets/images/airplane.png",

            ),
          )
        ],
      ),
    );
  }

}