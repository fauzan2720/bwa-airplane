import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:airplane/state_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubit/auth_cubit.dart';
import '../view/my_card_view.dart';

class MyCardController extends State<MyCardView> implements MvcController {
  static late MyCardController instance;
  late MyCardView view;

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

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
