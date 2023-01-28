import 'package:airplane/cubit/page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core.dart';
import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.index,
    required this.imageUrl,
  });
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        IconButton(
          onPressed: () {
            context.read<PageCubit>().setPage(index);
          },
          icon: ImageIcon(
            AssetImage(imageUrl),
            size: 24.0,
            color: context.read<PageCubit>().state == index
                ? primaryColor
                : secondaryColor,
          ),
        ),
        const Spacer(),
        if (context.read<PageCubit>().state == index)
          Container(
            height: 2.0,
            width: 30.0,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(1000.0)),
              color: primaryColor,
            ),
          ),
      ],
    );
  }
}
