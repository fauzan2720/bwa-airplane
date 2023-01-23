import 'package:flutter/material.dart';
import 'package:airplane/core.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  Widget build(context, SignUpController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: primarySize,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Join us and get\nyour next journey",
                style: TextStyle(
                  fontSize: 24.0,
                  color: darkColor,
                  fontWeight: semibold,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 30.0),
                decoration: BoxDecoration(
                  borderRadius: radiusPrimary,
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FozInputText(
                      label: "Full Name",
                      hintText: "Enter Full Name",
                      value: "",
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    FozInputText(
                      label: "Email Address",
                      hintText: "Enter Email Address",
                      value: "",
                      onChanged: (value) {},
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    FozInputPassword(
                      label: "Password",
                      hintText: "Enter Password",
                      value: "",
                      onChanged: (value) {},
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    FozInputText(
                      label: "Hobby",
                      hintText: "Enter Hobby",
                      value: "",
                      onChanged: (value) {},
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    FozPrimaryButton(
                      label: "Get Started",
                      onPressed: () => Get.put(const BonusView()),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Center(
                child: Text(
                  "Terms and Conditions",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: secondaryColor,
                    fontWeight: light,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<SignUpView> createState() => SignUpController();
}
