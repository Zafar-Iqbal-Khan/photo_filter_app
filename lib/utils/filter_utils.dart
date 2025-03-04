import 'package:flutter/material.dart';

class FilterUtils {
  static const ColorFilter noFilter =
      ColorFilter.mode(Colors.transparent, BlendMode.multiply);
  static final List<ColorFilter> filters = [
    noFilter,
    ColorFilter.mode(Colors.purple.withOpacity(0.3), BlendMode.softLight),
    ColorFilter.mode(Colors.blue.withOpacity(0.3), BlendMode.softLight),
    ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.softLight),
    ColorFilter.mode(Colors.orange.withOpacity(0.3), BlendMode.softLight),
  ];
}
