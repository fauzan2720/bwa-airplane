import 'package:flutter/material.dart';
import 'package:airplane/state_util.dart';
import '../view/bonus_view.dart';

class BonusController extends State<BonusView> implements MvcController {
  static late BonusController instance;
  late BonusView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}