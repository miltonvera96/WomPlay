import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wom_play/home/skillspage.dart';
import 'package:wom_play/home/tabs.dart';
import 'package:wom_play/user.dart';
import 'package:provider/provider.dart';

class Registrar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _RegistrarState();

}

class _RegistrarState extends State<Registrar>{

  TextEditingController nombre = TextEditingController();
  int edad=-1;
  List<String> sexo = ["Niño", "Niña"];
  String sexo_selected="";

  @override
  Widget build(BuildContext context) {

    double height_screen = MediaQuery.of(context).size.height;
    double width_screen = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: height_screen*0.35,
            width: double.maxFinite,
            decoration: BoxDecoration(
                // color: Color(0xff004e94),
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  // colorFilter: ColorFilter.mode(Colors.black12, BlendMode.multiply),
                  image: AssetImage(
                    "assets/images/welcome.png",
                  )
                ),
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30)
                )
            ),
            // child: Padding(
            //     padding: EdgeInsets.only(
            //         top: height_screen * 0.1
            //     ),
            //     child: Column(
            //       children: [
            //         Text(
            //           "Bienvenido!",
            //           style: TextStyle(
            //               fontWeight: FontWeight.w700,
            //               fontSize: height_screen*0.05,
            //               color: Colors.white
            //           ),
            //         ),
            //         Expanded(
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               // Text(
            //               //   "Escribe t",
            //               //   style: TextStyle(
            //               //       fontWeight: FontWeight.w400,
            //               //       fontSize: height_screen*0.025,
            //               //       color: Colors.white
            //               //   ),
            //               // ),
            //               Padding(
            //                 padding: EdgeInsets.symmetric(
            //                   horizontal: 30,
            //                 ),
            //                 child: _buildField(nombre, "Escribe tu nombre", Icons.person, false),
            //               )
            //             ],
            //           ),
            //         )
            //       ],
            //     )
            // ),
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    "Bienvenido!",
                    style: GoogleFonts.fredokaOne(
                        fontWeight: FontWeight.w300,
                        fontSize: height_screen*0.045,
                        color: Colors.black
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: _buildField(nombre, "Escribe tu nombre", Icons.person, false),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(2,
                    (index) => GestureDetector(
                      onTap: (){
                        setState(() {
                          sexo_selected=sexo[index];
                        });
                      },
                      child: Container(
                        width: width_screen * 0.3,
                        height: height_screen * 0.05,
                        margin: EdgeInsets.symmetric(
                            horizontal: width_screen *0.05,
                            vertical:  width_screen *0.02
                        ),
                        decoration: BoxDecoration(
                            color: sexo_selected== sexo[index]?  Color(0xff004e94): Colors.grey,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 0,
                                  blurRadius: 5
                              )
                            ],
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text(
                            "${sexo[index]}",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: height_screen*0.02,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 30
                      ),
                      child: Text(
                        "Selecciona tu edad",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: height_screen*0.022,
                            color: Colors.black
                        ),
                      ),
                    ),
                    Center(
                      child: Wrap(
                        children: List.generate(
                            4, (index) => GestureDetector(
                          onTap: (){
                            setState(() {
                              edad=index;
                            });
                          },
                          child: Container(
                            width: width_screen * 0.18,
                            height: width_screen * 0.18,
                            margin: EdgeInsets.symmetric(
                                horizontal: width_screen *0.05,
                                vertical:  width_screen *0.02
                            ),
                            decoration: BoxDecoration(
                                color: edad== index?  Color(0xff004e94): Colors.grey,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 0,
                                      blurRadius: 5
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text(
                                "${index + 9}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: height_screen*0.04,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        )
                        ),
                      ),
                    ),
                  ],
                ),
               Center(
                 child:  GestureDetector(
                   onTap: (){
                     if(nombre.text.isNotEmpty && sexo_selected.isNotEmpty){
                       context.read<User>().nombre = nombre.text;
                       context.read<User>().sexo = sexo_selected;
                       Navigator.push(context,
                           MaterialPageRoute(builder: (context) {
                             return TabsPage();
                           }));
                     }
                   },
                   child: Container(
                       height: height_screen * 0.05,
                       width: width_screen * 0.7,
                       decoration: BoxDecoration(
                           color: nombre.text.isNotEmpty && sexo_selected.isNotEmpty? Color(0xff004e94) : Colors.grey,
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
                               fontSize: 20,
                               color: Colors.white
                           ),
                         ),
                       )
                   ),
                 ),
               )
              ],
            ),
          )
          // Text(
          //   "Entrena habilidades suaves\n"
          //       "de manera divertida",
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //       fontSize: height_screen*0.02,
          //       color: Colors.grey[600]
          //   ),
          // ),
          // GestureDetector(
          //   onTap: (){
          //
          //     // Navigator.push(context,
          //     //     MaterialPageRoute(builder: (context) {
          //     //       return TabsPage();
          //     //     }));
          //   },
          //   child: Container(
          //       height: height_screen * 0.05,
          //       width: width_screen * 0.7,
          //       decoration: BoxDecoration(
          //           color: Color(0xff004e94),
          //           borderRadius: BorderRadius.circular(
          //               height_screen * 0.05
          //           ),
          //           boxShadow: [
          //             BoxShadow(
          //                 color: Colors.black.withOpacity(0.2),
          //                 blurRadius: 5,
          //                 spreadRadius: 0
          //             )
          //           ]
          //       ),
          //       child: Center(
          //         child: Text(
          //           "Registrar",
          //           style: TextStyle(
          //               fontWeight: FontWeight.w600,
          //               fontSize: 20,
          //               color: Colors.white
          //           ),
          //         ),
          //       )
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildField(TextEditingController controller, String label, IconData icon, bool pass) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 5,
            blurRadius: 20
          )
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              icon,
              color: Colors.grey[900],
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.words,
              obscureText: pass,
              controller: controller,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: label,
                hintStyle: TextStyle(
                    color: Colors.grey[900],
                    fontFamily: 'OpenSans',
                    fontSize: MediaQuery.of(context).size.height * 0.018
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}