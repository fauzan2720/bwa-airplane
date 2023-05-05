import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:airplane/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView(this.transaction, {Key? key}) : super(key: key);
  final TransactionModel transaction;

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
                width: Get.width - 80.0,
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
                        Hero(
                          tag: transaction.destination.id,
                          child: ClipRRect(
                            borderRadius: radiusPrimary,
                            child: Image.network(
                              transaction.destination.imageUrl!,
                              width: 70.0,
                              height: 70.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width - 220.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transaction.destination.name!,
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
                                transaction.destination.city!,
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
                              transaction.destination.rating.toString(),
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
                    BookingDetailItem(
                      title: "Traveler",
                      value: "${transaction.amountOfTraveler} person",
                    ),
                    BookingDetailItem(
                      title: "Seat",
                      value: transaction.selectedSeats,
                    ),
                    BookingDetailItem(
                      title: "Insurance",
                      value: transaction.insurance ? "YES" : "NO",
                      valueColor: transaction.insurance
                          ? const Color(0xff0EC3AE)
                          : const Color(0xffEB70A5),
                    ),
                    BookingDetailItem(
                      title: "Refundable",
                      value: transaction.refundable ? "YES" : "NO",
                      valueColor: transaction.refundable
                          ? const Color(0xff0EC3AE)
                          : const Color(0xffEB70A5),
                    ),
                    BookingDetailItem(
                      title: "VAT",
                      value: "${(transaction.vat * 100).toInt()}%",
                    ),
                    BookingDetailItem(
                      title: "Price",
                      value: CurrencyFormat.convertToIdr(transaction.price, 0),
                    ),
                    BookingDetailItem(
                      title: "Grand Total",
                      value: CurrencyFormat.convertToIdr(
                          transaction.grandTotal, 0),
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
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                state is AuthSuccess
                                    ? Text(
                                        CurrencyFormat.convertToIdr(
                                            state.user.balance, 0),
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: medium,
                                          color: darkColor,
                                        ),
                                      )
                                    : const SizedBox(),
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
                            );
                          },
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
              BlocConsumer<TransactionCubit, TransactionState>(
                listener: (context, state) {
                  if (state is TransactionSuccess) {
                    Get.put(const CheckoutSuccessView());
                    showSuccess();
                  } else if (state is TransactionFailed) {
                    showError(message: state.error);
                  }
                },
                builder: (context, state) {
                  if (state is TransactionLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return FozPrimaryButton(
                    label: "Pay Now",
                    onPressed: () {
                      context
                          .read<TransactionCubit>()
                          .createTransaction(transaction);
                      context.read<SeatCubit>().clearSeat();
                    },
                  );
                },
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
