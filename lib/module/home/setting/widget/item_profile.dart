import 'package:airplane/core.dart';
import 'package:flutter/material.dart';

Widget itemCard({
  required String label,
  required String value,
}) {
  return Padding(
    padding: primaryHorizontalSize,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20.0,
        ),
        Text(
          label,
          style: TextStyle(
            color: secondaryColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: medium,
            color: darkColor,
          ),
        ),
      ],
    ),
  );
}
