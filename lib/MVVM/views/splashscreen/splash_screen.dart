// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_store/MVVM/views/Product_Screen/product_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext) => ProductScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Splash.png'),
                fit: BoxFit.cover)),
      ),
    );
  }
}
