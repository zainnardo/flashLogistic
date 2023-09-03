import 'package:flashlogistic/common/navigation.dart';
import 'package:flashlogistic/common/router.dart';
import 'package:flashlogistic/widgets/widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int _splashDuration = 3;

  _navigateToNextPage() {
    Future.delayed(Duration(seconds: _splashDuration), () {
      Navigation.pushRemoveNoData(homePageRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: wSplashScreen(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToNextPage();
  }
}
