import 'package:flutter/material.dart';
import 'package:airplane/core.dart';

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
              Padding(
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
                            "Howdy,\nFauzan Abdillah",
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
                        image: const DecorationImage(
                          image:
                              NetworkImage("https://i.ibb.co/PGv8ZzG/me.jpg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),

              // POPULAR DESTINATION
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: horizontalSize / 2),
                  child: Row(
                    children: const [
                      PopularDestinationCard(),
                      PopularDestinationCard(),
                      PopularDestinationCard(),
                      PopularDestinationCard(),
                      PopularDestinationCard(),
                    ],
                  ),
                ),
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
              const NewDestinationCard(),
              const NewDestinationCard(),
              const NewDestinationCard(),
              const NewDestinationCard(),
              const NewDestinationCard(),
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
