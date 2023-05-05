import 'package:airplane/cubit/seat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:airplane/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseSeatView extends StatefulWidget {
  const ChooseSeatView(this.destination, {Key? key}) : super(key: key);
  final DestinationModel destination;

  Widget build(context, ChooseSeatController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: primarySize,
          child: BlocBuilder<SeatCubit, List<String>>(
            builder: (context, state) {
              return Column(
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
                      const SeatItem(),
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
                      const SeatItem(
                        isSelectedRequest: true,
                      ),
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
                      const SeatItem(
                        isAvailable: false,
                      ),
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
                            const SeatItem(
                              id: "A1",
                            ),
                            const SeatItem(
                              id: "B1",
                            ),
                            seatIndicator("1"),
                            const SeatItem(
                              id: "C1",
                            ),
                            const SeatItem(
                              id: "D1",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SeatItem(
                              id: "A2",
                            ),
                            const SeatItem(
                              id: "B2",
                            ),
                            seatIndicator("2"),
                            const SeatItem(
                              id: "C2",
                            ),
                            const SeatItem(
                              id: "D2",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SeatItem(
                              id: "A3",
                            ),
                            const SeatItem(
                              id: "B3",
                            ),
                            seatIndicator("3"),
                            const SeatItem(
                              id: "C3",
                            ),
                            const SeatItem(
                              id: "D3",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SeatItem(
                              id: "A4",
                            ),
                            const SeatItem(
                              id: "B4",
                            ),
                            seatIndicator("4"),
                            const SeatItem(
                              id: "C4",
                            ),
                            const SeatItem(
                              id: "D4",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SeatItem(
                              id: "A5",
                            ),
                            const SeatItem(
                              id: "B5",
                            ),
                            seatIndicator("5"),
                            const SeatItem(
                              id: "C5",
                              isAvailable: false,
                            ),
                            const SeatItem(
                              id: "D5",
                              isAvailable: false,
                            ),
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
                            const SizedBox(
                              width: 20.0,
                            ),
                            Flexible(
                              child: Text(
                                state.isEmpty ? '-' : state.join(', '),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: medium,
                                  color: darkColor,
                                ),
                                textAlign: TextAlign.end,
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
                              CurrencyFormat.convertToIdr(
                                  destination.price! * state.length, 0),
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
                    onPressed: () {
                      if (state.isNotEmpty) {
                        double vat = 45 / 100;
                        int price = destination.price! * state.length;
                        double grandTotal = price + (price * vat);

                        Get.put(
                          CheckoutView(
                            TransactionModel(
                              destination: destination,
                              amountOfTraveler: state.length,
                              selectedSeats: state.join(', '),
                              vat: vat,
                              price: price,
                              grandTotal: grandTotal.toInt(),
                              insurance: true,
                            ),
                          ),
                        );
                      } else {
                        showError(message: "Pilih kursimu terlebih dahulu");
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  State<ChooseSeatView> createState() => ChooseSeatController();
}
