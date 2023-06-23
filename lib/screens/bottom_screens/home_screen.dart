import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecco_app/utils/styles.dart';
import 'package:ecco_app/widgets/home_card.dart';
import 'package:flutter/material.dart';

List categories = [
  "GROCERY",
  "ELECTRONICES",
  "COSMETICS",
  "PHARMACY",
  "GARMENTS"
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List images = [
    "https://cdn.pixabay.com/photo/2015/09/21/14/24/supermarket-949913_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/19/08/hangers-1850082_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/07/24/21/01/thermometer-1539191_960_720.jpg",
    "https://cdn.pixabay.com/photo/2015/09/21/14/24/supermarket-949913_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/19/08/hangers-1850082_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/07/24/21/01/thermometer-1539191_960_720.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /*first portion start here*/
            Center(
              child: Text(
                'Home Screen',
                style: EcoStyle.boldStyle,
              ),
            ),
            /*first portion end here*/
            /*second portion start here*/
            CarouselSlider(
                items: images
                    .map(
                      (e) => Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                e,
                                fit: BoxFit.fill,
                                height: 200,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(colors: [
                                  Colors.red.withOpacity(0.3),
                                  Colors.blue.withOpacity(0.3)
                                ]),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "TITLE",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                )),

            /*second portion end here*/
            /*third portion start here*/
            HomeCards(
              title: categories[0],
            ),
            HomeCards(
              title: categories[1],
            ),
            HomeCards(
              title: categories[2],
            ),
            HomeCards(
              title: categories[3],
            ),
            HomeCards(
              title: categories[4],
            ),
            /*third portion end here*/
          ],
        ),
      ),
    );
  }
}
