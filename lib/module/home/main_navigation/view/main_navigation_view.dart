import 'package:airplane/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  Widget build(context, MainNavigationController controller) {
    controller.view = this;

    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: controller.handleBody(state),
          floatingActionButton: Container(
            height: 65.0,
            margin:
                EdgeInsets.fromLTRB(horizontalSize, 0.0, horizontalSize, 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 0.1,
                  offset: const Offset(0, 0),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavItem(
                  index: 0,
                  imageUrl: iconHome,
                ),
                BottomNavItem(
                  index: 1,
                  imageUrl: iconBooking,
                ),
                BottomNavItem(
                  index: 2,
                  imageUrl: iconCard,
                ),
                BottomNavItem(
                  index: 3,
                  imageUrl: iconSetting,
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
