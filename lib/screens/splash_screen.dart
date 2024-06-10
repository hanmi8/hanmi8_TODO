import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadSplash(); // 앱이 시작될 때 특정 작업을 수행
  }

  _loadSplash() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushNamed(context, "/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          "images/fc-logo1.svg",
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}