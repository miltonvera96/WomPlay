import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wom_play/datos.dart';
import 'package:wom_play/user.dart';

class FatherNotifications extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _FatherNotificationsState();
}

class _FatherNotificationsState extends State<FatherNotifications>{

  int touchedIndex = -1;

  List<Color> colores = [
    Color(0xff0293ee),Color(0xfff8b250), Color(0xff845bef), Color(0xff13d38e), Colors.pink
  ];

  List<double> values = [
    40, 30, 15, 15,15
  ];



  @override
  Widget build(BuildContext context) {

    double height_screen = MediaQuery.of(context).size.height;
    double width_screen = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: context.watch<User>().categoria.isEmpty?
            Column(
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
                          "Bienvenido, padre!",
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
                           "Aquí estará la retroalimentación de acuerdo a las respuestas "
                              "obtenidas en los niveles resueltos",
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
            ):
            ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: height_screen * 0.1,
                ),
                Text(
                  "Representación de categorías según respuestas",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height:  height_screen * 0.05,
                ),
                AspectRatio(
                    aspectRatio: 1,
                    child: Consumer<User>(
                      builder: (context, user, _child){
                        double total = user.categoriasrespondidas.values.toList().reduce((a, b) => a + b);
                        Map<String, double> percentages = {};
                        for( String key in user.categoriasrespondidas.keys){
                          percentages[key] = (user.categoriasrespondidas[key]/ total) * 100;
                          print(percentages[key]);
                        }
                        return Column(
                          children: [
                            Wrap(
                                children: List.generate(
                                    percentages.length, (index) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: colores[index],
                                      ),
                                      Text(
                                        "${percentages.keys.toList()[index]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                            ),
                            Expanded(
                              child: PieChart(
                                  PieChartData(
                                      pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                                        setState(() {
                                          final desiredTouch = pieTouchResponse.touchInput is! PointerExitEvent &&
                                              pieTouchResponse.touchInput is! PointerUpEvent;
                                          if (desiredTouch && pieTouchResponse.touchedSection != null) {
                                            touchedIndex = pieTouchResponse.touchedSection.touchedSectionIndex;
                                          } else {
                                            touchedIndex = -1;
                                          }
                                        });
                                      }),
                                      borderData: FlBorderData(
                                        show: false,
                                      ),
                                      sectionsSpace: 0,
                                      centerSpaceRadius: 50,
                                      sections: List.generate(
                                          user.categoriasrespondidas.length,
                                              (i) {
                                            final isTouched = i == touchedIndex;
                                            final fontSize = isTouched ? 20.0 : 15.0;
                                            final radius = isTouched ? 60.0 : 50.0;

                                            return PieChartSectionData(
                                              color: colores[i],
                                              value: percentages.values.toList()[i].toDouble(),
                                              title: '${percentages.values.toList()[i].toStringAsFixed(2)}%',
                                              radius: radius,
                                              titleStyle: TextStyle(
                                                  fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                            );
                                          })
                                  )
                              ),
                            ),
                          ],
                        );
                      },
                    )
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20
                  ),
                  child: Column(
                      children: List.generate(
                          5,
                              (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Datos.categorias[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                Datos.categorias_descripction[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              )
                            ],
                          )
                      )
                  ),
                ),
                SizedBox(
                  height: height_screen * 0.1,
                ),
              ],
            )
        ),
      ],
    );
  }


}