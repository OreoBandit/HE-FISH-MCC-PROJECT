import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class my_carousel extends StatefulWidget {
  const my_carousel({Key? key}) : super(key: key);

  @override
  State<my_carousel> createState() => _my_carouselState();
}

class _my_carouselState extends State<my_carousel> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  final List<String> imgList = [
    "assets/images/koi 1.jpg",
    "assets/images/koi 2.jpg",
    "assets/images/koi 3.jpg",
    "assets/images/koi 4.jpeg",
    "assets/images/koi 5.jpg",
  ];

  //CAROUSEL MODELLING
  List<Widget> carousel_model() {
    return imgList
        .map(
          (item) => Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(item, fit: BoxFit.cover),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: carousel_model(),
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
      ),
    );
  }
}
