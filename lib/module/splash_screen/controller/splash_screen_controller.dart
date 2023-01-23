import 'package:airplane/core.dart';
import 'package:flutter/material.dart';

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
      () => Get.put(const GetStartedView()),
    );
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
