import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class App_Bar extends StatelessWidget implements  PreferredSizeWidget {
  double screenHeight ;
  double screenWidth;
  App_Bar(this.screenHeight, this.screenWidth, {super.key});
  @override
  Widget build(BuildContext context) {

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        padding: const EdgeInsets.only(top: 22,left: 8,right: 8,bottom: 8),
        decoration:  const BoxDecoration(
          color: Color(0xFF548F4A),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Image(

              image: AssetImage(

                "assets/icons/appIcon.png",
              ),
            ),
            SizedBox(
              width: screenWidth / 65,
            ),            Text(
              "NewsBuzz",
              style: TextStyle(

                foreground: Paint()
                  ..shader = ui.Gradient.linear(
                    const Offset(85, 150),
                    const Offset(90, 40),
                    <Color>[
                      Colors.black,
                      Colors.white,
                    ],
                  ),
                fontSize: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  const Size.fromHeight(kToolbarHeight);

}
