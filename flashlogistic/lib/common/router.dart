

import 'package:flashlogistic/ui/features/data_delivery_page.dart';
import 'package:flashlogistic/ui/home_page.dart';
import 'package:flashlogistic/ui/splash_screen.dart';
import 'package:flutter/material.dart';

const String splashScreenRoute = '/splashScreen';
const String homePageRoute = '/home';
const String deliveryRoute = '/delivery';

Map<String, Widget Function(BuildContext)> myRoutes = <String, WidgetBuilder>{
  splashScreenRoute: (context) => SplashScreen(),
  homePageRoute    : (context) => HomePage(),
  deliveryRoute    : (context) => DataDeliveryPage(),
};
