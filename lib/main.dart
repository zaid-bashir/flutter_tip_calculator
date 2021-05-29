import 'package:flutter/material.dart';
import 'package:tipcalculatorapp/splash.dart';

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tip Calculator",
      home: new Splash(),
    )
  );
}