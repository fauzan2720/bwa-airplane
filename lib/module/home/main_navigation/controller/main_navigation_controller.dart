import '/core.dart';
import 'package:flutter/material.dart';

class MainNavigationController extends State<MainNavigationView>
    implements MvcController {
  static late MainNavigationController instance;
  late MainNavigationView view;

  int currentIndex = 0;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  handleBody() {
    switch (currentIndex) {
      case 0:
        return const HomeView();
      case 1:
        return const Center(
          child: Text("No Data"),
        );
      case 2:
        return const Center(
          child: Text("No Card"),
        );
      case 3:
        return const Center(
          child: Text("Settings"),
        );
      default:
        return const HomeView();
    }
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
