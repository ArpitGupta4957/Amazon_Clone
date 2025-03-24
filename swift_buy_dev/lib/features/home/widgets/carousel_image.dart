import 'package:amazon_clone/constants/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: AppGlobalVariables.carouselImages.map((e) {
        return Builder(builder: (BuildContext context)=>Image.network(e,fit: BoxFit.cover,height: 200,));
      }).toList(), options: CarouselOptions(
      height: 200,
        viewportFraction: 1
    ),
    );
  }
}
