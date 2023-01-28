import 'package:airplane/core.dart';
import 'package:airplane/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpController extends State<SignUpView> implements MvcController {
  static late SignUpController instance;
  late SignUpView view;

  String name = '', email = '', password = '', photoUrl = '', hobby = '';

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  void signUp() {
    context.read<AuthCubit>().signUp(
          email: email,
          password: password,
          name: name,
          photoUrl: photoUrl,
          hobby: hobby,
        );
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
