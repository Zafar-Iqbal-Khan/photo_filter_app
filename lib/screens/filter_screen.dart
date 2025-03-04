import 'dart:io';
import 'package:flutter/material.dart';
import '../utils/filter_utils.dart';
import '../widgets/filter_selector.dart';
import 'home_screen.dart';

class FilterScreen extends StatefulWidget {
  final List<File> images;
  const FilterScreen({super.key, required this.images});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  ColorFilter _selectedFilter = FilterUtils.noFilter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apply Filters')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.images.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ColorFiltered(
                  colorFilter: _selectedFilter,
                  child: Image.file(widget.images[index], height: 200),
                ),
              ),
            ),
          ),
          FilterSelector(
            onFilterSelected: (filter) {
              setState(() {
                _selectedFilter = filter;
              });
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(
                      images: widget.images, filter: _selectedFilter),
                ),
              );
            },
            child: const Text('Share', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
