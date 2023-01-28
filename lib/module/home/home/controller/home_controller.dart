import 'package:airplane/cubit/destination_cubit.dart';
import 'package:flutter/material.dart';
import 'package:airplane/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeController extends State<HomeView> implements MvcController {
  static late HomeController instance;
  late HomeView view;

  @override
  void initState() {
    instance = this;
    context.read<DestinationCubit>().fetchDestination();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
