import 'package:airplane/core.dart';
import 'package:flutter/material.dart';

class SeatItem extends StatelessWidget {
  const SeatItem({super.key, required this.status, this.size});
  final int status;
  final double? size;

  /*
    1. status 1 = available
    1. status 2 = selected
    1. status 3 = unavailable
  */

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 48.0,
      height: size ?? 48.0,
      decoration: BoxDecoration(
        color: status == 2 ? primaryColor : const Color(0xffE0D9FF),
        borderRadius: BorderRadius.circular(size == null ? 15.0 : 6.0),
        border: status == 1
            ? Border.all(
                width: size == null ? 2.0 : 1.0,
                color: primaryColor,
              )
            : null,
      ),
      child: status == 2 && size == null
          ? Center(
              child: Text(
                "YOU",
                style: TextStyle(
                  color: whiteColor,
                  fontWeight: semibold,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
