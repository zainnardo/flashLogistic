import 'package:flashlogistic/common/images.dart';
import 'package:flutter/material.dart';

//TODO: SplashScreen Page
Widget wSplashScreen() {
  return Stack(
    children: <Widget>[
      /// Background
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgSplashScreenBg),
            fit: BoxFit.cover
          )
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(36.0),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imgLogoWithName),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    ],
  );
}


