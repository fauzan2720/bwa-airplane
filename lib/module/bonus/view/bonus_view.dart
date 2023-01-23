import 'package:flutter/material.dart';
import 'package:airplane/core.dart';

class BonusView extends StatefulWidget {
  const BonusView({Key? key}) : super(key: key);

  Widget build(context, BonusController controller) {
    controller.view = this;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200.0,
              width: 300.0,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(cardBonus),
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
              child: Column(
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
                            "Fauzan Abdillah",
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
                    CurrencyFormat.convertToIdr(280000000, 0),
                    style: TextStyle(
                      fontWeight: medium,
                      color: whiteColor,
                      fontSize: 26.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 90.0,
            ),
            Text(
              "Big Bonus 🎉",
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
              "We give you early credit so that\nyou can buy a flight ticket",
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
              label: "Start Fly Now",
              onPressed: () => Get.put(const MainNavigationView()),
              width: 220.0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<BonusView> createState() => BonusController();
}
