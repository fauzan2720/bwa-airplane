import 'package:flutter/material.dart';
import 'package:airplane/core.dart';

class ChooseSeatController extends State<ChooseSeatView>
    implements MvcController {
  static late ChooseSeatController instance;
  late ChooseSeatView view;

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
