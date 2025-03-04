import 'package:flutter/material.dart';
import '../utils/filter_utils.dart';

class FilterSelector extends StatelessWidget {
  final Function(ColorFilter) onFilterSelected;

  const FilterSelector({super.key, required this.onFilterSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(FilterUtils.filters.length, (index) {
        return GestureDetector(
          onTap: () {
            onFilterSelected(FilterUtils.filters[index]);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: ColorFiltered(
              colorFilter: FilterUtils.filters[index],
              child: Container(color: Colors.grey),
            ),
          ),
        );
      }),
    );
  }
}
