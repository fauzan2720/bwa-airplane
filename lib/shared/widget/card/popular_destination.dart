import 'package:airplane/core.dart';
import 'package:flutter/material.dart';

class PopularDestinationCard extends StatelessWidget {
  const PopularDestinationCard(this.destination, {super.key});
  final DestinationModel destination;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(DetailDestinationView(destination)),
      child: Container(
        margin: primaryHorizontalSize / 2,
        width: 200.0,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: radiusPrimary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              width: 180.0,
              height: 220.0,
              decoration: BoxDecoration(
                borderRadius: radiusPrimary,
                image: DecorationImage(
                  image: NetworkImage(destination.imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 30.0,
                  width: 55.0,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(radiusPrimarySize),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: yellowColor,
                        size: 24.0,
                      ),
                      Text(
                        destination.rating.toString(),
                        style: TextStyle(
                          fontWeight: medium,
                          color: darkColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name!,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: darkColor,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    destination.city!,
                    style: TextStyle(
                      color: secondaryColor,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ).animate().fadeIn(delay: 100.ms),
    );
  }
}
