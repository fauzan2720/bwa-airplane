import 'package:flutter/material.dart';
import 'package:airplane/core.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({Key? key}) : super(key: key);

  Widget build(context, CheckoutController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: primarySize,
          child: Column(
            children: [
              // ROUTE
              Image.asset(
                imageCheckout,
                width: Get.width,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CGK",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: semibold,
                          color: darkColor,
                        ),
                      ),
                      Text(
                        "Tangerang",
                        style: TextStyle(
                          fontWeight: light,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "TLC",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: semibold,
                          color: darkColor,
                        ),
                      ),
                      Text(
                        "Ciliwung",
                        style: TextStyle(
                          fontWeight: light,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),

              // BOOKING DETAILS
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 30.0),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: radiusPrimary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: radiusPrimary,
                          child: Image.network(
                            "https://picsum.photos/1000",
                            width: 70.0,
                            height: 70.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: Get.width - 220.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Danau Beratan",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: medium,
                                  color: darkColor,
                                ),
                              ),
                              const SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                "Singajara",
                                style: TextStyle(
                                  fontWeight: light,
                                  color: secondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: yellowColor,
                              size: 24.0,
                            ),
                            Text(
                              "4.8",
                              style: TextStyle(
                                fontWeight: medium,
                                color: darkColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),

                    // DETAILS
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Booking Details",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: darkColor,
                        fontWeight: semibold,
                      ),
                    ),
                    const BookingDetailItem(
                      title: "Traveler",
                      value: "2 person",
                    ),
                    const BookingDetailItem(
                      title: "Seat",
                      value: "A3, B3",
                    ),
                    const BookingDetailItem(
                      title: "Insurance",
                      value: "YES",
                      valueColor: Color(0xff0EC3AE),
                    ),
                    const BookingDetailItem(
                      title: "Refundable",
                      value: "NO",
                      valueColor: Color(0xffEB70A5),
                    ),
                    const BookingDetailItem(
                      title: "VAT",
                      value: "45%",
                    ),
                    BookingDetailItem(
                      title: "Price",
                      value: CurrencyFormat.convertToIdr(8500290, 0),
                    ),
                    BookingDetailItem(
                      title: "Grand Total",
                      value: CurrencyFormat.convertToIdr(12000000, 0),
                      valueColor: primaryColor,
                    ),
                  ],
                ),
              ),

              // PAYMENT DETAILS
              const SizedBox(
                height: 30.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: radiusPrimary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment Details",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: darkColor,
                        fontWeight: semibold,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(cardBonus),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: primaryColor.withOpacity(0.2),
                                spreadRadius: 0.1,
                                blurRadius: 25.0,
                                offset: const Offset(0, 15),
                              ),
                              //you can set more BoxShadow() here
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              CurrencyFormat.convertToIdr(80400000, 0),
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: medium,
                                color: darkColor,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "Current Balance",
                              style: TextStyle(
                                fontWeight: light,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),

              // PAY NOW
              const SizedBox(
                height: 30.0,
              ),
              FozPrimaryButton(
                label: "Pay Now",
                onPressed: () => Get.put(const CheckoutSuccessView()),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Text(
                  "Terms and Conditions",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: secondaryColor,
                    fontWeight: light,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<CheckoutView> createState() => CheckoutController();
}
