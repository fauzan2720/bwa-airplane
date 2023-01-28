import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:airplane/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({Key? key}) : super(key: key);

  Widget build(context, TransactionController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(bottom: 100.0),
          child: BlocBuilder<TransactionCubit, TransactionState>(
            builder: (context, state) {
              if (state is TransactionLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TransactionSuccess) {
                if (state.transactions.isEmpty) {
                  return SizedBox(
                    height: Get.height - 200.0,
                    child: const Center(
                      child: Text("No Transaction"),
                    ),
                  );
                } else {
                  return Column(
                    children: state.transactions
                        .map((e) => TransactionCard(e))
                        .toList(),
                  );
                }
              } else {
                return const Center(
                  child: Text("No Transaction"),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  State<TransactionView> createState() => TransactionController();
}
