import 'package:airplane/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:airplane/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                      value: controller.name,
                      onChanged: (value) {
                        controller.name = value;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    FozInputText(
                      label: "Email Address",
                      hintText: "Enter Email Address",
                      value: controller.email,
                      onChanged: (value) {
                        controller.email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    FozInputPassword(
                      label: "Password",
                      hintText: "Enter Password",
                      value: controller.password,
                      onChanged: (value) {
                        controller.password = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    FozInputText(
                      label: "Hobby",
                      hintText: "Enter Hobby",
                      value: controller.hobby,
                      onChanged: (value) {
                        controller.hobby = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    FozImagePicker(
                      label: "Your Photo",
                      onChanged: (value) {
                        controller.photoUrl = value;
                      },
                      gallery: true,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          Get.offAll(const BonusView());
                          showSuccess();
                        } else if (state is AuthFailed) {
                          showError(message: state.error);
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return FozPrimaryButton(
                          label: "Get Started",
                          onPressed: () => controller.signUp(),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Have an account? ",
                      children: [
                        TextSpan(
                          text: "Sign In",
                          style: TextStyle(color: primaryColor),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: secondaryColor,
                      fontWeight: light,
                    ),
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
