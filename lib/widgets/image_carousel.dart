import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatelessWidget {
  final List<File> images;
  final ColorFilter filter;

  const ImageCarousel({super.key, required this.images, required this.filter});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CarouselSlider(
        options: CarouselOptions(
            height: 200, enlargeCenterPage: true, enableInfiniteScroll: false),
        items: images.map((image) {
          return ColorFiltered(
            colorFilter: filter,
            child: Image.file(image,
                fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
          );
        }).toList(),
      ),
    );
  }
}
