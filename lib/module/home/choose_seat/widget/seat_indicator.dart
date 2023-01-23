import 'package:airplane/core.dart';
import 'package:flutter/material.dart';

Widget seatIndicator(String label) {
  return SizedBox(
    width: 48.0,
    child: Center(
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16.0,
          color: secondaryColor,
        ),
      ),
    ),
  );
}
