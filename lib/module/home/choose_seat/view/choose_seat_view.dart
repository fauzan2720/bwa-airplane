import 'package:flutter/material.dart';
import 'package:airplane/core.dart';

class ChooseSeatView extends StatefulWidget {
  const ChooseSeatView({Key? key}) : super(key: key);

  Widget build(context, ChooseSeatController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: primarySize,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Your\nFavorite Seat",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: semibold,
                  color: darkColor,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  const SeatItem(status: 1, size: 16.0),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Text(
                    "Available",
                    style: TextStyle(color: darkColor),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const SeatItem(status: 2, size: 16.0),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Text(
                    "Selected",
                    style: TextStyle(color: darkColor),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const SeatItem(status: 3, size: 16.0),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Text(
                    "Unavailable",
                    style: TextStyle(color: darkColor),
                  ),
                ],
              ),

              // SEAT INDICATORS
              const SizedBox(
                height: 30.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 22.0, vertical: 30.0),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: radiusPrimary,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        seatIndicator("A"),
                        seatIndicator("B"),
                        seatIndicator(""),
                        seatIndicator("C"),
                        seatIndicator("D"),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SeatItem(status: 3),
                        const SeatItem(status: 3),
                        seatIndicator("1"),
                        const SeatItem(status: 1),
                        const SeatItem(status: 3),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SeatItem(status: 1),
                        const SeatItem(status: 1),
                        seatIndicator("2"),
                        const SeatItem(status: 1),
                        const SeatItem(status: 3),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SeatItem(status: 2),
                        const SeatItem(status: 2),
                        seatIndicator("3"),
                        const SeatItem(status: 1),
                        const SeatItem(status: 1),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SeatItem(status: 1),
                        const SeatItem(status: 3),
                        seatIndicator("4"),
                        const SeatItem(status: 1),
                        const SeatItem(status: 1),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SeatItem(status: 1),
                        const SeatItem(status: 1),
                        seatIndicator("5"),
                        const SeatItem(status: 3),
                        const SeatItem(status: 1),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your seat",
                          style: TextStyle(
                              fontWeight: light, color: secondaryColor),
                        ),
                        Text(
                          "A3, B3",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: medium,
                            color: darkColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              fontWeight: light, color: secondaryColor),
                        ),
                        Text(
                          CurrencyFormat.convertToIdr(540000000, 0),
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: semibold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              FozPrimaryButton(
                label: "Continue to Checkout",
                onPressed: () => Get.put(const CheckoutView()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ChooseSeatView> createState() => ChooseSeatController();
}
