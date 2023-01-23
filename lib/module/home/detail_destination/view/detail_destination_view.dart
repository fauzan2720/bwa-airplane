import 'package:flutter/material.dart';
import 'package:airplane/core.dart';

class DetailDestinationView extends StatefulWidget {
  const DetailDestinationView({Key? key}) : super(key: key);

  Widget build(context, DetailDestinationController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.network(
              "https://picsum.photos/1000",
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
                            "Lake Ciliwung",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: semibold,
                              color: whiteColor,
                            ),
                          ),
                          Text(
                            "Tangerang",
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
                            "4.8",
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
                            "Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.",
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
                              children: [
                                InkWell(
                                  onTap: () => Get.to(const PhotoViewWidget()),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: ClipRRect(
                                      borderRadius: radiusPrimary,
                                      child: Image.network(
                                        "https://picsum.photos/1000",
                                        width: 70.0,
                                        height: 70.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => Get.to(const PhotoViewWidget()),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: ClipRRect(
                                      borderRadius: radiusPrimary,
                                      child: Image.network(
                                        "https://i.ibb.co/PGv8ZzG/me.jpg",
                                        width: 70.0,
                                        height: 70.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                            children: [
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    interestItem(label: "Kids Park"),
                                    interestItem(label: "City Museum"),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    interestItem(label: "Honor Bridge"),
                                    interestItem(label: "Central Mall"),
                                  ],
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
                            CurrencyFormat.convertToIdr(250000000, 0),
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
                        onPressed: () => Get.to(const ChooseSeatView()),
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
