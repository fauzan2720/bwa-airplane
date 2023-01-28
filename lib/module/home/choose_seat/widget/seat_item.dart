import 'package:airplane/core.dart';
import 'package:airplane/cubit/seat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  const SeatItem({
    super.key,
    this.id,
    this.isAvailable = true,
    this.isSelectedRequest = false,
  });
  final String? id;
  final bool isAvailable;
  final bool isSelectedRequest;

  /*
    1. status 1 = available
    1. status 2 = selected
    1. status 3 = unavailable
  */

  @override
  Widget build(BuildContext context) {
    bool isSelected;
    if (id == null) {
      isSelected = false;
    } else {
      isSelected = context.watch<SeatCubit>().isSelected(id!);
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selcetSeat(id!);
        }
      },
      child: Container(
        width: id == null ? 16.0 : 48.0,
        height: id == null ? 16.0 : 48.0,
        decoration: BoxDecoration(
          color: isSelected || isSelectedRequest
              ? primaryColor
              : const Color(0xffE0D9FF),
          borderRadius: BorderRadius.circular(id == null ? 6.0 : 15.0),
          border: isAvailable
              ? Border.all(
                  width: id == null ? 1.0 : 2.0,
                  color: primaryColor,
                )
              : null,
        ),
        child: isSelected && id != null
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
      ),
    );
  }
}
