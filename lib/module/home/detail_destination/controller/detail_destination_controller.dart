import 'package:flutter/material.dart';
import 'package:airplane/core.dart';

class DetailDestinationController extends State<DetailDestinationView>
    implements MvcController {
  static late DetailDestinationController instance;
  late DetailDestinationView view;

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
