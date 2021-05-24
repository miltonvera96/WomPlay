import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:just_audio/just_audio.dart';
import 'package:wom_play/datos.dart';
import 'package:wom_play/home/question.dart';

class Stage extends StatefulWidget{

  String title, description, skill, audio;
  int nivel;
  List<String> images;
  Stage({this.description, this.title, this.nivel, this.skill, this.images, this.audio});

  @override
  State<StatefulWidget> createState() => _StageState();

}

class _StageState extends State<Stage>{

  AudioPlayer player;
  SwiperController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = SwiperController();

    player = AudioPlayer();
    player.setAsset("assets/audio/${widget.audio}");
    player.play();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double height_screen = MediaQuery.of(context).size.height;
    double width_screen = MediaQuery.of(context).size.width;

    List<String> dialog = widget.description.split('\n');

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SizedBox(
              height: height_screen,
              child: Swiper(
                controller: controller,
                itemCount: widget.images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Image.asset(
                      "assets/images/stage${widget.images[index]}",
                        height: height_screen,
                        width: width_screen ,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top:20,
                        // alignment: Alignment.center,
                        child: Container(
                          width: width_screen*0.9,
                          padding: EdgeInsets.symmetric(
                            vertical: height_screen *0.01,
                            horizontal: width_screen *0.1
                          ),
                          margin: EdgeInsets.only(
                            top: height_screen*0.05,
                            left: width_screen*0.05
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              width: 5,
                              color: Colors.black
                            ),
                            color: Colors.white
                          ),
                          child: Center(
                            child:  Text(
                              dialog[index+1],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: height_screen*0.025,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
                //indicatorLayout: PageIndicatorLayout.COLOR,
                loop: false,
                autoplay: true,
                autoplayDelay: 25000,
                scrollDirection: Axis.horizontal,
                // pagination: new SwiperPagination(),
                //control: new SwiperControl(),
              ),
            ),

            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      }
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: (){

                      }
                  )
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.3,
              maxChildSize: 0.4,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      color: Colors.white
                  ),
                  height: height_screen *0.35,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    controller: scrollController,
                    physics: BouncingScrollPhysics(),
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Container(
                          height: 5,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: height_screen*0.025,
                                color: Colors.black
                            ),
                          ),
                          IconButton(
                            splashColor: Colors.black,
                            icon: Icon(
                              Icons.replay,
                              color: Colors.black,
                            ),
                            onPressed: (){
                              player.stop();
                              controller.stopAutoplay();
                              if(!player.playing){
                                player.play();
                                controller.startAutoplay();
                              }
                            }
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        dialog[0],
                        style: TextStyle(
                            fontSize: height_screen*0.02,
                            color: Colors.grey[600]
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          player.stop();
                          print(Datos.solutions[widget.skill]["${widget.title}_${widget.nivel}"]);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return Question(
                                  title: dialog[3],
                                  level: widget.nivel,
                                  skill: widget.skill,
                                  stage: int.parse(widget.title.split(' ')[1]),
                                  opciones: Datos.solutions[widget.skill]["${widget.title}_${widget.nivel}"],
                                  correct_answer: Datos.correct_solution[widget.skill]["${widget.title}_${widget.nivel}"],
                                );
                              }));
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
                                "Siguiente",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white
                                ),
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        )
    );
  }

}