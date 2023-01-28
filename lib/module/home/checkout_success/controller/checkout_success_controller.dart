import 'package:flutter/material.dart';
import 'package:airplane/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/page_cubit.dart';

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

  void toMyBookings() {
    context.read<PageCubit>().setPage(1);
    Get.offAll(const MainNavigationView());
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
