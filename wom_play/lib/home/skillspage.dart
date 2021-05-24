import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wom_play/datos.dart';
import 'package:wom_play/home/skilldetail.dart';

class SkillsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SkillsPageState();

}

class _SkillsPageState extends State<SkillsPage>{

  @override
  Widget build(BuildContext context) {

    double height_screen = MediaQuery.of(context).size.height;
    double width_screen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/classes.png",
                  height: height_screen*0.6,
                  width: width_screen,
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 20,
                      top: height_screen*0.1
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        "Aprendamos juntos",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: height_screen*0.02,
                            color: Colors.grey[600]
                        ),
                      ),
                      SizedBox(
                        height: height_screen*0.02,
                      ),
                      GestureDetector(
                        onTap: (){

                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //       return SkillsPage();
                          //     }));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 5
                            ),
                            width: width_screen*0.4,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(
                                    10
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
                                "Visítanos",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white
                                ),
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Habilidades",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: height_screen*0.025,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: List.generate(
                      Datos.skills.length,
                          (index) => GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return SkillsDetail(
                                    title:"Resolución de conflictos",
                                    description: "Un conflicto no siempre es negativo. Cuando ocurra uno, debes tomarlo como una gran oportunidad para aprender y mejorar la manera de resolverlo, conocerte a ti mismo y a los demás, así como a relacionarte con ellos. "
                                );
                              }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Datos.skills[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: height_screen*0.02,
                                        color: Colors.black
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "3 niveles",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: height_screen*0.015,
                                        color: Colors.grey[600]
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                        ,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.matrix(
                          <double>[
                            0.2126,0.7152,0.0722,0,0,
                            0.2126,0.7152,0.0722,0,0,
                            0.2126,0.7152,0.0722,0,0,
                            0,0,0,1,0,
                          ]
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            // boxShadow: [
                            //   BoxShadow(
                            //       color: Colors.grey[400],
                            //       spreadRadius: 0,
                            //       blurRadius: 10
                            //   ),
                            // ],
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
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Inteligencia emocional",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: height_screen*0.02,
                                  color: Colors.grey[600]
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "3 niveles",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: height_screen*0.015,
                                  color: Colors.grey[400]
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }

}