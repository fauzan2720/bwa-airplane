import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:airplane/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  Widget build(context, SettingController controller) {
    controller.view = this;

    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 250.0,
            decoration: BoxDecoration(
              color: primaryColor,
            ),
          ),
          Column(
            children: [
              Container(
                padding: primaryHorizontalSize,
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSuccess) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 60.0,
                          ),
                          Text(
                            "My Profile",
                            style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: semibold,
                              color: whiteColor,
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 60.0),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 30.0),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: radiusPrimary,
                                  boxShadow: [
                                    BoxShadow(
                                      color: primaryColor.withOpacity(0.2),
                                      spreadRadius: 0.1,
                                      blurRadius: 25.0,
                                      offset: const Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    Center(
                                      child: Text(
                                        state.user.name,
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: semibold,
                                          color: darkColor,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          iconCard,
                                          width: 20.0,
                                        ),
                                        const SizedBox(
                                          width: 8.0,
                                        ),
                                        Text(
                                          CurrencyFormat.convertToIdr(
                                              state.user.balance, 0),
                                          style: TextStyle(
                                            color: secondaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    itemCard(
                                      label: "Email",
                                      value: state.user.email,
                                    ),
                                    itemCard(
                                      label: "Hobby",
                                      value: state.user.hobby == ''
                                          ? "-"
                                          : state.user.hobby,
                                    ),
                                    itemCard(
                                      label: "Joined",
                                      value: DateFormat("d MMM y").format(
                                          DateTime.parse(
                                              state.user.createdAt!)),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Container(
                                  width: 110.0,
                                  height: 110.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(state.user.photoUrl),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(100.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: primaryColor.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 10.0,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthInitial) {
                    context.read<PageCubit>().setPage(0);
                    Get.put(const SignInView());
                    showSuccess();
                  } else if (state is AuthFailed) {
                    showError(message: state.error);
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Padding(
                    padding: primaryHorizontalSize,
                    child: FozPrimaryButton(
                      label: "Sign Out",
                      onPressed: () => controller.signOut(),
                      backgroundButton: Colors.red[700],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  State<SettingView> createState() => SettingController();
}
