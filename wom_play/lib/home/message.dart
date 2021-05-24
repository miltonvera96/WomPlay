import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget{

  final GestureTapCallback reintentar;
  final GestureTapCallback siguiente;

  final bool success;
  final String success_message;
  final String error_message;

  Message({this.reintentar, this.siguiente, this.success,this.error_message, this.success_message});

  @override
  State<StatefulWidget> createState() => MessageState();
}

class MessageState extends State<Message>{
  Color principal = Color(0xff004e94);

  @override
  Widget build(BuildContext context) {

    double height_screen = MediaQuery.of(context).size.height;
    double width_screen = MediaQuery.of(context).size.width;

    return Container(
      height: height_screen * 0.4,
      width: width_screen * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: _ShapeClipperProfile(),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20)
                    ),
                    gradient: LinearGradient(
                      colors: [
                        principal,
                        principal.withOpacity(0.7),
                        principal.withOpacity(0.6)
                      ],
                    ),
                  ),
                  height: height_screen * 0.20,
                ),
              ),
              widget.success ? Positioned(
                top: height_screen * 0.015,
                child: Container(
                  height: height_screen * 0.17,
                  width: height_screen * 0.7,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/party.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ): Center(),
              Positioned(
                right: 8,
                top: 8,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black38
                    ),
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                )
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.success ? "Correcto!" : "Ups!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height_screen * 0.03,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: height_screen * 0.015,),
                    Container(
                        width: width_screen * 0.6,
                        child: SingleChildScrollView(
                          child: Text(
                            widget.success ?
                            widget.success_message: widget.error_message,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: height_screen * 0.018,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                        )
                    ),
                    Text(
                      widget.success ? "+ 2 puntos" : "+ 0 puntos",
                      style: TextStyle(
                          color: Colors.yellow[800],
                          fontSize: height_screen * 0.018,
                          fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                          widget.reintentar();
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey[200]
                                )
                            ),
                            // gradient: LinearGradient(
                            //   colors: [Colors.blue[100],Colors.blue[50]],
                            // ),
                          ),
                          child: Center(
                            child: Text(
                              widget.success? "" : "Reintentar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: principal,
                                  fontSize: MediaQuery.of(context).size.height * 0.019,
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                          widget.siguiente();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20)
                            ),
                            gradient: LinearGradient(
                              colors: [
                                principal,
                                principal.withOpacity(0.8),
                                principal.withOpacity(0.7)
                              ],
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.05,
                          child : Center(
                            child: Text(
                              "Siguiente",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height * 0.02,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                ],
              )
            ],
          )
          // Expanded(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Text(
          //         widget.success ? "Correcto!" : "Ups!",
          //         style: TextStyle(
          //             color: Colors.white,
          //             fontSize: height_screen * 0.03,
          //             fontWeight: FontWeight.bold
          //         ),
          //       ),
          //       SizedBox(height: height_screen * 0.015,),
          //       Container(
          //         width: width_screen * 0.6,
          //         child: SingleChildScrollView(
          //           child: Text(
          //             widget.success ?
          //             widget.success_message: widget.error_message,
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //                 color: Colors.grey[800],
          //                 fontSize: height_screen * 0.018,
          //                 fontWeight: FontWeight.normal
          //             ),
          //           ),
          //         )
          //       )
          //     ],
          //   ),
          // ),

        ],
      ),
    );
  }


}


class _ShapeClipperProfile extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
        size.width/3, size.height/2.2, size.width, size.height/2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}