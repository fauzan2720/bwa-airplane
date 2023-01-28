import 'package:flutter/material.dart';
import 'package:airplane/core.dart';

class CheckoutSuccessView extends StatefulWidget {
  const CheckoutSuccessView({Key? key}) : super(key: key);

  Widget build(context, CheckoutSuccessController controller) {
    controller.view = this;

    return Scaffold(
      body: Container(
        padding: primarySize,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageSuccess),
            const SizedBox(
              height: 80.0,
            ),
            Text(
              "Well Booked 😍",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: semibold,
                color: darkColor,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Are you ready to explore the new\nworld of experiences?",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: light,
                color: secondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50.0,
            ),
            FozPrimaryButton(
              label: "My Bookings",
              onPressed: () => controller.toMyBookings(),
              width: 220.0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<CheckoutSuccessView> createState() => CheckoutSuccessController();
}
