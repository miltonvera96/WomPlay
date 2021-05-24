import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wom_play/datos.dart';
import 'package:wom_play/home/stage.dart';
import 'package:provider/provider.dart';
import 'package:wom_play/user.dart';

class SkillsDetail extends StatefulWidget{

  String title, description;
  SkillsDetail({this.description, this.title});

  @override
  State<StatefulWidget> createState() => _SkillsDetailState();

}

class _SkillsDetailState extends State<SkillsDetail>{

  @override
  Widget build(BuildContext context) {

    double height_screen = MediaQuery.of(context).size.height;
    double width_screen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: height_screen*0.4,
                      width: width_screen,
                      color: Color(0xff22b573),
                    ),
                    Image.asset(
                      "assets/images/banner_skill.png",
                      height: height_screen*0.5,
                      width: width_screen ,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20,
                          top: height_screen*0.15
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width_screen * 0.65,
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: height_screen*0.045,
                                  color: Colors.white
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height_screen*0.05,
                          ),
                          Text(
                            "Para niños de 9 a 12 años",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: height_screen*0.020,
                                color: Colors.white
                            ),
                          ),

                        ],
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
                        "Acerca de la habilidad",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: height_screen*0.025,
                            color: Colors.black
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.description,
                        style: TextStyle(
                            fontSize: height_screen*0.017,
                            color: Colors.grey[600]
                        ),
                      ),

                    ],
                  ),
                ),
                Column(
                  // physics: BouncingScrollPhysics(),
                  children: List.generate(
                      Datos.levels[widget.title].length,
                      (level_index) => Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: Theme(
                            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              // tilePadding: EdgeInsets.zero,
                              leading: Consumer<User>(
                                builder: (context, user, _child){
                                  bool finished =
                                    user.progress[widget.title].contains(Datos.levels[widget.title][level_index]);

                                  return Icon(
                                    Icons.check_circle_rounded,
                                    color: finished? Colors.green : Colors.grey[400],
                                  );
                                },
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          Datos.levels[widget.title][level_index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: height_screen*0.022,
                                              color: Colors.black
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${Datos.stages[widget.title][Datos.levels[widget.title][level_index]].length} escenarios",
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
                              ),
                              children: List.generate(
                                  Datos.stages[widget.title][Datos.levels[widget.title][level_index]].length,
                                      (stage_index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 50
                                    ),
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                              return Stage(
                                                title: "Escenario ${stage_index + 1}",
                                                nivel: level_index + 1,
                                                skill: widget.title,
                                                description: Datos.stages[widget.title][Datos.levels[widget.title][level_index]][stage_index],
                                                images: Datos.imagenes[widget.title][Datos.levels[widget.title][level_index]][stage_index].split(","),
                                                audio: Datos.audios[widget.title][Datos.levels[widget.title][level_index]][stage_index],
                                              );
                                            }));
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
                                            "Ir a escenario ${stage_index + 1}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: height_screen*0.019,
                                                color: Colors.black
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                              ),
                            )
                        ),
                      )
                  ),
                ),
                SizedBox(
                  height: height_screen * 0.05 + 40,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: (){

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return Stage(
                        title: "Escenario ${0 + 1}",
                        nivel: 1,
                        skill: widget.title,
                        description: Datos.stages[widget.title][Datos.levels[widget.title][0]][0],
                        images: Datos.imagenes[widget.title][Datos.levels[widget.title][0]][0].split(","),
                        audio: Datos.audios[widget.title][Datos.levels[widget.title][0]][0],
                      );
                    }));
              },
              child: Container(
                  height: height_screen * 0.05,
                  width: width_screen * 0.7,
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
                      "Comenzar",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                  )
              ),
            ),
          )
        ],
      )
    );
  }

}