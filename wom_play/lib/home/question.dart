import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wom_play/home/finish.dart';
import 'package:wom_play/home/message.dart';
import 'package:wom_play/home/stage.dart';
import 'package:wom_play/user.dart';
import '../datos.dart';
import 'package:provider/provider.dart';

class Question extends StatefulWidget{

  String title, skill;
  int stage, level;
  List<List> opciones;
  List<dynamic> correct_answer;
  Question({this.opciones, this.title, this.level, this.stage, this.skill, this.correct_answer});

  @override
  State<StatefulWidget> createState() => _QuestionState();

}

class _QuestionState extends State<Question>{

  int index_radio = 0;

  @override
  Widget build(BuildContext context) {

    double height_screen = MediaQuery.of(context).size.height;
    double width_screen = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: height_screen * 0.1,
              right: -100,
              child: Image.asset(
                "assets/images/question.png",
                height: height_screen * 0.8,
                width: width_screen ,
                fit: BoxFit.fitHeight,
              ),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.black,
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          }
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                          onPressed: (){

                          }
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10
                        ),
                        width: width_screen * 0.9,
                        child: Text(
                          "Basado en lo sucedio en el Escenario ${widget.stage}",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: height_screen*0.03,
                              color: Colors.black
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 30
                        ),
                        width: width_screen * 0.5,
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: height_screen*0.025,
                              color: Colors.grey[900]
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
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
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 10
                      )
                    ]
                ),
                height: height_screen *0.5,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  // controller: scrollController,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Center(
                    //   child: Container(
                    //     height: 5,
                    //     width: 50,
                    //     decoration: BoxDecoration(
                    //         color: Colors.grey,
                    //         borderRadius: BorderRadius.circular(15)
                    //     ),
                    //   ),
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                          widget.opciones.length,
                              (index) => Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10
                            ),
                            child: RadioListTile<int>(
                                title: Text(
                                    widget.opciones[index][0]
                                ),
                                activeColor: Colors.yellow[700],
                                value: index,
                                groupValue: index_radio,
                                onChanged: (value){
                                  setState(() {
                                    index_radio = value;
                                  });
                                }
                            ),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: (){

                          if(widget.correct_answer[0] == index_radio)
                            context.read<User>().addPoints(2);
                          context.read<User>().addCategoria(widget.opciones[index_radio][1]);
                          showDialog(
                            context: context,
                            builder: (context){
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Message(
                                  success: widget.correct_answer[0] == index_radio,
                                  success_message : widget.correct_answer[1],
                                  error_message : widget.correct_answer[2],
                                  reintentar: (){
                                  },
                                  siguiente: (){
                                    String nivel = Datos.levels[widget.skill][widget.level-1];
                                    if(widget.stage >= Datos.stages[widget.skill][nivel].length){
                                      Navigator.pop(context);
                                      context.read<User>().completeLevel(widget.skill, nivel);
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                            return FinishLevel(nivel);
                                          })
                                      );
                                    }
                                    else{
                                      Navigator.pop(context);
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                            return Stage(
                                              title: "Escenario ${widget.stage + 1}",
                                              nivel: widget.level,
                                              skill: widget.skill,
                                              description: Datos.stages[widget.skill][nivel][widget.stage],
                                              images: Datos.imagenes[widget.skill][nivel][widget.stage].split(","),
                                              audio: Datos.audios[widget.skill][nivel][widget.stage],
                                            );
                                          })
                                      );
                                    }
                                  },
                                ),
                                );
                              }
                          );


                        },
                        child: Container(
                            height: height_screen * 0.04,
                            width: width_screen * 0.5,
                            margin: EdgeInsets.only(
                                bottom: 30
                            ),
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
                                "Aceptar",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white
                                ),
                              ),
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
            // DraggableScrollableSheet(
            //   initialChildSize: 0.5,
            //   minChildSize: 0.5,
            //   maxChildSize: 0.7,
            //   builder: (context, scrollController) {
            //     return ;
            //   },
            // )
          ],
        )
    );
  }

}