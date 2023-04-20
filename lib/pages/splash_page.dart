import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:valyuta_kurs/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  static const route = "splash_page";
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  void _initTimer() {
    Timer(const Duration(milliseconds: 3500), () {
      _callNextPage();
    });
  }

  _callNextPage() {

    Navigator.pushReplacementNamed(context, '/second');
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/lottie/splash.json"),
      ),
    );
    
  }
}
