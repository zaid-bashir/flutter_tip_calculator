import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tipcalculatorapp/Screens/Home.dart';
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new TipCalculator(),
      title: new Text(
        'Tip Calculator in Your Pocket',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
      ),
      image: new Image.asset(
          'assets/splash.png'),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
      photoSize: 50,
      useLoader: true,
      loadingText: Text("Designed and Developed by Zaid Wani",style: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold),),
    );
  }
}