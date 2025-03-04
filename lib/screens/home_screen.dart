import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/image_carousel.dart';

class HomeScreen extends StatelessWidget {
  final List<File> images;
  final ColorFilter filter;

  const HomeScreen({super.key, required this.images, required this.filter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text('John Karter',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('11 hours ago',
                      style: TextStyle(color: Colors.grey)),
                ),
                ImageCarousel(images: images, filter: filter),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
