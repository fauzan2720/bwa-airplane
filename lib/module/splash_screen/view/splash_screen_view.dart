import 'package:flutter/material.dart';
import 'package:airplane/core.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  Widget build(context, SplashScreenController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logo,
              width: 100.0,
              height: 100.0,
            ),
            const SizedBox(
              height: 50.0,
            ),
            Text(
              "AIRPLANE",
              style: TextStyle(
                fontSize: 32.0,
                color: whiteColor,
                fontWeight: medium,
                letterSpacing: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<SplashScreenView> createState() => SplashScreenController();
}
