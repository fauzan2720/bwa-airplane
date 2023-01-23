import 'package:flutter/material.dart';
import 'package:airplane/core.dart';

class CheckoutSuccessController extends State<CheckoutSuccessView>
    implements MvcController {
  static late CheckoutSuccessController instance;
  late CheckoutSuccessView view;

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
