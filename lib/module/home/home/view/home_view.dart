import 'package:airplane/cubit/destination_cubit.dart';
import 'package:flutter/material.dart';
import 'package:airplane/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/auth_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: primaryVerticalSize,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthSuccess) {
                    return Padding(
                      padding: primaryHorizontalSize,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width - 50 - (horizontalSize * 2),
                                child: Text(
                                  "Howdy,\n${state.user.name}",
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    color: darkColor,
                                    fontWeight: semibold,
                                  ),
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              const SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                "Where to fly today?",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: secondaryColor,
                                  fontWeight: light,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(state.user.photoUrl),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(
                height: 30.0,
              ),

              // POPULAR DESTINATION
              BlocConsumer<DestinationCubit, DestinationState>(
                listener: (context, state) {
                  if (state is DestinationFailed) {
                    showError(message: state.error);
                  }
                },
                builder: (context, state) {
                  if (state is DestinationSuccess) {
                    state.destinations
                        .sort((b, a) => a.rating!.compareTo(b.rating!));

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: horizontalSize / 2),
                        child: Row(
                          children: state.destinations.map((e) {
                            return PopularDestinationCard(e);
                          }).toList(),
                        ),
                      ),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              const SizedBox(
                height: 30.0,
              ),

              // NEW DESTINATION
              Padding(
                padding: primaryHorizontalSize,
                child: Text(
                  "New This Year",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: semibold,
                    color: darkColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              BlocConsumer<DestinationCubit, DestinationState>(
                listener: (context, state) {
                  if (state is DestinationFailed) {
                    showError(message: state.error);
                  }
                },
                builder: (context, state) {
                  if (state is DestinationSuccess) {
                    state.destinations.sort((a, b) => a.id.compareTo(b.id));

                    return Column(
                      children: state.destinations.map((e) {
                        return NewDestinationCard(e);
                      }).toList(),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              const SizedBox(
                height: 80.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
