import 'package:airplane/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/auth_cubit.dart';

class SplashScreenController extends State<SplashScreenView>
    implements MvcController {
  static late SplashScreenController instance;
  late SplashScreenView view;

  @override
  void initState() {
    instance = this;
    getInit();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  void getInit() {
    Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        User? user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          Get.put(const GetStartedView());
        } else {
          context.read<AuthCubit>().getCurrentUser(user.uid);
          Get.put(const MainNavigationView());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
