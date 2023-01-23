import 'package:airplane/core.dart';
import 'package:flutter/material.dart';

Widget customShadow() {
  return Container(
    margin: const EdgeInsets.only(top: 450.0 - 214.0),
    width: Get.width,
    height: 214.0,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          whiteColor.withOpacity(0),
          blackColor.withOpacity(0.95),
        ],
      ),
    ),
  );
}
