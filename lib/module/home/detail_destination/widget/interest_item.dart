import 'package:airplane/core.dart';
import 'package:flutter/material.dart';

Widget interestItem({
  required String label,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Row(
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
          label,
          style: TextStyle(
            fontWeight: medium,
            color: darkColor,
          ),
        ),
      ],
    ),
  );
}
