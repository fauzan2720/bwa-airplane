import 'package:flutter/material.dart';
import 'package:airplane/state_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/auth_cubit.dart';
import '../view/sign_in_view.dart';

class SignInController extends State<SignInView> implements MvcController {
  static late SignInController instance;
  late SignInView view;

  String email = 'fauzan@gmail.com', password = '123123123';

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  void signIn() {
    context.read<AuthCubit>().signIn(
          email: email,
          password: password,
        );
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
