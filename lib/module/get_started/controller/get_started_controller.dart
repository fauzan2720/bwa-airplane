import 'package:flutter/material.dart';
import 'package:airplane/state_util.dart';
import '../view/get_started_view.dart';

class GetStartedController extends State<GetStartedView> implements MvcController {
  static late GetStartedController instance;
  late GetStartedView view;

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