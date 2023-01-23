import 'package:flutter/material.dart';
import 'package:airplane/core.dart';

class CheckoutController extends State<CheckoutView> implements MvcController {
  static late CheckoutController instance;
  late CheckoutView view;

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
