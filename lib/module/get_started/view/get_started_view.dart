import 'package:flutter/material.dart';
import 'package:airplane/core.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({Key? key}) : super(key: key);

  Widget build(context, GetStartedController controller) {
    controller.view = this;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            backgroundSplashScreen,
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Fly Like a Bird",
                  style: TextStyle(
                    fontSize: 32.0,
                    color: whiteColor,
                    fontWeight: semibold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Explore new world with us and let\nyourself get an amazing experiences",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: light,
                    color: whiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                FozPrimaryButton(
                  label: "Get Started",
                  onPressed: () => Get.put(const SignUpView()),
                  width: 220.0,
                ),
                const SizedBox(
                  height: 80.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<GetStartedView> createState() => GetStartedController();
}
