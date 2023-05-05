import 'package:airplane/core.dart';
import 'package:flutter/material.dart';

class NewDestinationCard extends StatelessWidget {
  const NewDestinationCard(this.destination, {super.key});
  final DestinationModel destination;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(DetailDestinationView(destination)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalSize, vertical: 8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: radiusPrimary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: destination.id,
              child: ClipRRect(
                borderRadius: radiusPrimary,
                child: Image.network(
                  destination.imageUrl!,
                  width: 70.0,
                  height: 70.0,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: Get.width - 210.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name!,
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
                    destination.city!,
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
                  "${destination.rating}",
                  style: TextStyle(
                    fontWeight: medium,
                    color: darkColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ).animate().fadeIn(delay: 100.ms),
    );
  }
}
