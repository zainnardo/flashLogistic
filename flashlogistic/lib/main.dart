import 'package:flashlogistic/common/navigation.dart';
import 'package:flashlogistic/common/providers.dart';
import 'package:flashlogistic/common/router.dart';
import 'package:flashlogistic/common/styles.dart';
import 'package:flashlogistic/config_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:version_banner/version_banner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      title: ConfigApp.appName,
      debugShowCheckedModeBanner: false,
      navigatorKey: myNavigatorKey,
      initialRoute: splashScreenRoute,
      routes: myRoutes,
      theme: ThemeData(
        primarySwatch: Palette.primeColor,
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
        cursorColor: accentOrange,
          selectionColor: darkOrange,
          selectionHandleColor: accentOrange
        )

      )
    );
    return MultiProvider(
      providers: myProviders,
      child: VersionBanner(
        text: 'DEV',
        textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
        visible: true,
        location: BannerLocation.topStart,
        color: darkOrange,
        child: materialApp,
      ),
    );
  }
}

