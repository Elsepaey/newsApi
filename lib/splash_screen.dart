import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'home/homeScreen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    var Height=MediaQuery.of(context).size.height;
    var Width=MediaQuery.of(context).size.width;

    return AnimatedSplashScreen(

splashIconSize: Width/1.5,

        duration: 200,
        splash: Image(image: const AssetImage("assets/images/undraw_The_world_is_mine_re_j5cr.png",),height:Height ,width:Width,),
        nextScreen:  const Homescreen(),
        splashTransition: SplashTransition.fadeTransition,

        backgroundColor: const Color(0xFFFDFDFD));
  }
}