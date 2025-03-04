import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<List<File>> pickImages() async {
  final pickedFiles = await ImagePicker().pickMultiImage();
  return pickedFiles.map((e) => File(e.path)).toList();
}
