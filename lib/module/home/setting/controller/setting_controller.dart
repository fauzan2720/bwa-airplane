import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:airplane/state_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubit/auth_cubit.dart';
import '../view/setting_view.dart';

class SettingController extends State<SettingView> implements MvcController {
  static late SettingController instance;
  late SettingView view;

  @override
  void initState() {
    instance = this;
    context
        .read<AuthCubit>()
        .getCurrentUser(FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  void signOut() {
    context.read<AuthCubit>().signOut();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
