import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:wom_play/user.dart';

import '../datos.dart';

class Profile extends StatefulWidget{

  String title, skill;
  int stage, level;
  List<String> opciones;
  Profile({this.opciones, this.title, this.level, this.stage, this.skill});

  @override
  State<StatefulWidget> createState() => _ProfileState();

}

class _ProfileState extends State<Profile>{

  int index_radio = 0;

  @override
  Widget build(BuildContext context) {

    double height_screen = MediaQuery.of(context).size.height;
    double width_screen = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff6985e7).withOpacity(0.81),
                    Color(0xff1b1464).withOpacity(0.81)
                  ],
                  begin: Alignment.topRight,
                    end: Alignment.bottomLeft
                )
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: height_screen * 0.2
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/avatar_back.png",
                      height: height_screen * 0.2,
                      width: width_screen ,
                      fit: BoxFit.fitHeight,
                    ),
                    Image.asset(
                      "assets/images/${context.watch<User>().sexo == "Niño" ? "boy" : "girl"}.png",
                      height: height_screen * 0.2,
                      width: width_screen ,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
              )
            ),
            SafeArea(
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30
                    ),
                    width: width_screen,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hola, ${context.read<User>().nombre}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height_screen*0.035,
                              color: Colors.white
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                                Icons.star,
                                color: Colors.yellow[700],
                              size: height_screen * 0.030,

                            ),
                            Text(
                              "${context.watch<User>().puntos}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: height_screen*0.02,
                                  color: Colors.white
                              ),
                            )
                          ],
                        )
                      ],
                    )
                ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    color: Colors.white,
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Colors.black.withOpacity(0.2),
                    //       spreadRadius: 0,
                    //       blurRadius: 10,
                    //     offset: Offset(0, 5)
                    //   )
                    // ]
                ),
                height: height_screen *0.45,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    Text(
                      "Progreso de aprendizaje",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: height_screen*0.025,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: List.generate(
                        Datos.skills.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              child: GestureDetector(
                                onTap: (){
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Datos.skills[index],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: height_screen*0.02,
                                                color: Colors.black
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                width: width_screen*0.5,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffa4a1c1),
                                                    borderRadius: BorderRadius.circular(20)
                                                ),
                                              ),
                                              Container(
                                                width: (width_screen*0.5 / Datos.levels[Datos.skills[index]].length) * context.watch<User>().progress[Datos.skills[index]].length,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    color: Color(0xff1b1464),
                                                    borderRadius: BorderRadius.circular(20)
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "${Datos.levels[Datos.skills[index]].length} niveles",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: height_screen*0.015,
                                                color: Colors.grey[600]
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              // Navigator.push(context,
                                              // MaterialPageRoute(builder: (context) {
                                              //   return Stage(
                                              //     title: "Escenario ${stage_index + 1}",
                                              //     nivel: level_index + 1,
                                              //     skill: widget.title,
                                              //     description: Datos.stages[widget.title][Datos.levels[widget.title][level_index]][stage_index],
                                              //   );
                                              // }));
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black
                                                  ),
                                                  child: Icon(
                                                    Icons.play_arrow,
                                                    color: Colors.white,
                                                    size: 10,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Continuar aprendizaje",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: height_screen*0.017,
                                                      color: Colors.black
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey[400],
                                                spreadRadius: 0,
                                                blurRadius: 10
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      child: Image.asset(
                                        "assets/images/skill2.png",
                                        height: height_screen*0.08,
                                        width: height_screen*0.08,
                                        fit: BoxFit.fitHeight,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }

}