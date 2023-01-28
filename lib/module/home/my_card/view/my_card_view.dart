import 'package:airplane/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:airplane/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCardView extends StatefulWidget {
  const MyCardView({Key? key}) : super(key: key);

  Widget build(context, MyCardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wallet"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: primarySize,
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: 200.0,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(cardBonus),
                    fit: BoxFit.fill,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.2),
                      spreadRadius: 0.1,
                      blurRadius: 25.0,
                      offset: const Offset(0, 25),
                    ),
                    //you can set more BoxShadow() here
                  ],
                ),
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSuccess) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name",
                                    style: TextStyle(
                                      fontWeight: light,
                                      color: whiteColor,
                                    ),
                                  ),
                                  Text(
                                    state.user.name,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: medium,
                                      color: whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    logo,
                                    width: 24.0,
                                    height: 24.0,
                                  ),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  Text(
                                    "Pay",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: medium,
                                      color: whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Text(
                            "Balance",
                            style: TextStyle(
                              fontWeight: light,
                              color: whiteColor,
                            ),
                          ),
                          Text(
                            CurrencyFormat.convertToIdr(state.user.balance, 0),
                            style: TextStyle(
                              fontWeight: medium,
                              color: whiteColor,
                              fontSize: 26.0,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<MyCardView> createState() => MyCardController();
}
