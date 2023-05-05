import 'package:airplane/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard(this.transaction, {super.key});
  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
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
            title: "Date",
            value: DateFormat("d MMM y (HH:m)")
                .format(DateTime.parse(transaction.createdAt!)),
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
            value: CurrencyFormat.convertToIdr(transaction.grandTotal, 0),
            valueColor: primaryColor,
          ),
        ],
      ),
    ).animate().fadeIn(delay: 100.ms);
  }
}
