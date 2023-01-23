import '/core.dart';
import 'package:flutter/material.dart';

class BottomNavItem extends StatefulWidget {
  const BottomNavItem({
    super.key,
    required this.index,
    required this.imageUrl,
    required this.isActive,
  });
  final int index;
  final String imageUrl;
  final bool isActive;

  @override
  State<BottomNavItem> createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        IconButton(
          onPressed: () {
            MainNavigationController.instance.currentIndex = widget.index;
            MainNavigationController.instance.setState(() {});
          },
          icon: ImageIcon(
            AssetImage(widget.imageUrl),
            size: 24.0,
            color: widget.isActive ? primaryColor : secondaryColor,
          ),
        ),
        const Spacer(),
        if (widget.isActive)
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
