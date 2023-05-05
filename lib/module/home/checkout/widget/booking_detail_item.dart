import 'package:airplane/core.dart';
import 'package:flutter/material.dart';

class BookingDetailItem extends StatelessWidget {
  const BookingDetailItem({
    super.key,
    required this.title,
    required this.value,
    this.valueColor,
    this.isSeat = false,
  });
  final String title;
  final String value;
  final Color? valueColor;
  final bool isSeat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                iconCheck,
                color: primaryColor,
                width: 16.0,
                height: 16.0,
              ),
              const SizedBox(
                width: 6.0,
              ),
              Text(
                title,
                style: TextStyle(
                  color: darkColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 50.0,
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: semibold,
                color: valueColor ?? darkColor,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
