import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:airplane/state_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view/transaction_view.dart';

class TransactionController extends State<TransactionView>
    implements MvcController {
  static late TransactionController instance;
  late TransactionView view;

  @override
  void initState() {
    instance = this;
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
