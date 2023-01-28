import 'package:flutter/material.dart';
import 'package:airplane/core.dart';

class DetailDestinationView extends StatefulWidget {
  const DetailDestinationView(this.destination, {Key? key}) : super(key: key);
  final DestinationModel destination;

  Widget build(context, DetailDestinationController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.network(
              destination.imageUrl!,
              width: Get.width,
              height: 450.0,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              alignment: Alignment.center,
              child: Image.asset(
                iconEmblem,
                height: 24.0,
                fit: BoxFit.fill,
              ),
            ),
            customShadow(),
            Container(
              padding: primaryHorizontalSize,
              child: Column(
                children: [
                  const SizedBox(
                    height: 310.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destination.name!,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: semibold,
                              color: whiteColor,
                            ),
                          ),
                          Text(
                            destination.city!,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: light,
                              color: whiteColor,
                            ),
                          ),
                        ],
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
                              color: whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: radiusPrimary,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "About",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: semibold,
                              color: darkColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            destination.about!,
                            style: TextStyle(color: darkColor),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "Photos",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: semibold,
                              color: darkColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: ScrollController(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0 - 8.0),
                            child: Row(
                              children: destination.photos!
                                  .map(
                                    (e) => InkWell(
                                      onTap: () => Get.to(
                                          PhotoViewWidget(destination.photos!)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: ClipRRect(
                                          borderRadius: radiusPrimary,
                                          child: Image.network(
                                            e,
                                            width: 70.0,
                                            height: 70.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "Interests",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: semibold,
                              color: darkColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: destination.interests!
                                      .map((e) =>
                                          destination.interests!.indexOf(e) %
                                                      2 ==
                                                  0
                                              ? interestItem(label: e)
                                              : const SizedBox())
                                      .toList(),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: destination.interests!
                                      .map((e) =>
                                          destination.interests!.indexOf(e) %
                                                      2 ==
                                                  1
                                              ? interestItem(label: e)
                                              : const SizedBox())
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // BOOK NOW
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            CurrencyFormat.convertToIdr(destination.price, 0),
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: medium,
                              color: darkColor,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "per orang",
                            style: TextStyle(
                              fontWeight: light,
                              color: secondaryColor,
                            ),
                          ),
                        ],
                      ),
                      FozPrimaryButton(
                        label: "Book Now",
                        onPressed: () => Get.to(ChooseSeatView(destination)),
                        width: (Get.width / 2) - 24.0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<DetailDestinationView> createState() => DetailDestinationController();
}
