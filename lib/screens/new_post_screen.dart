import 'dart:io';
import 'package:flutter/material.dart';
import 'filter_screen.dart';
import '../utils/image_picker_util.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  List<File> _selectedImages = [];

  Future<void> _pickImages() async {
    final images = await pickImages();
    if (images.isNotEmpty) {
      setState(() {
        _selectedImages = images;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Post')),
      body: Column(
        children: [
          _selectedImages.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _selectedImages.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(_selectedImages[index], height: 200),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          ElevatedButton(
            onPressed: _pickImages,
            child: const Text('Pick Images'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            onPressed: () {
              if (_selectedImages.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilterScreen(images: _selectedImages),
                  ),
                );
              }
            },
            child: const Text('Next', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
