import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  Color icon_background;
  Icon icon;
  // var icon_color;
  late String menu_text;
  late String button_text;

  BottomMenu(
      {required this.icon_background,
      required this.icon,
      required this.menu_text,
      required this.button_text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      // Bottum menu columen
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Bottom menu container
          Container(
            margin: const EdgeInsets.all(7),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              // color: Color(0xFFD1A6FF).withOpacity(0.8),
              color: Color.fromARGB(178, 239, 196, 250),
              // borderRadius: BorderRadius.circular(10.0),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                // bottomLeft: Radius.circular(40.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF8E67AD),
                  offset: Offset(5, 5),
                  blurRadius: 6,
                ),
              ],
            ),
            // width: 450,
            // height: 250,
            // alignment: Alignment.bottomCenter,
            // Calender icon card
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // calender icon card
                Card(
                  color: icon_background,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  // Calender icon container
                  child: Container(
                    // color: Color(0xFF2AEBB1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: icon,
                  ),
                ),
                // daily check in text
                Text(
                  menu_text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                // daily check in button card
                Card(
                  color: Color(0xFFE94057),
                  elevation: 3,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  // Calender icon container
                  child: Container(
                    padding: EdgeInsets.all(4),

                    // color: Color(0xFF2AEBB1),
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.monetization_on_sharp,
                            color: Colors.yellow, size: (30)),
                        Text(
                          button_text,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
