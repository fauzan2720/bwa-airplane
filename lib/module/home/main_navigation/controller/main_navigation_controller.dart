import '/core.dart';
import 'package:flutter/material.dart';

class MainNavigationController extends State<MainNavigationView>
    implements MvcController {
  static late MainNavigationController instance;
  late MainNavigationView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  handleBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomeView();
      case 1:
        return const TransactionView();
      case 2:
        return const MyCardView();
      case 3:
        return const SettingView();
      default:
        return const HomeView();
    }
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
