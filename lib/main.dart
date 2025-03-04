// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'dart:io';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Image Post App',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//       ),
//       home: const StartScreen(),
//     );
//   }
// }

// class StartScreen extends StatelessWidget {
//   const StartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const NewPostScreen()),
//             );
//           },
//           child: const Text('Start', style: TextStyle(color: Colors.white)),
//         ),
//       ),
//     );
//   }
// }

// class NewPostScreen extends StatefulWidget {
//   const NewPostScreen({super.key});

//   @override
//   _NewPostScreenState createState() => _NewPostScreenState();
// }

// class _NewPostScreenState extends State<NewPostScreen> {
//   List<File> _selectedImages = [];

//   Future<void> _pickImages() async {
//     final pickedFiles = await ImagePicker().pickMultiImage();
//     if (pickedFiles.isNotEmpty) {
//       setState(() {
//         _selectedImages = pickedFiles.map((e) => File(e.path)).toList();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('New Post')),
//       body: Column(
//         children: [
//           _selectedImages.isNotEmpty
//               ? Expanded(
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: _selectedImages.length,
//                     itemBuilder: (context, index) => Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Image.file(_selectedImages[index], height: 200),
//                     ),
//                   ),
//                 )
//               : const SizedBox.shrink(),
//           ElevatedButton(
//             onPressed: _pickImages,
//             child: const Text('Pick Images'),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
//             onPressed: () {
//               if (_selectedImages.isNotEmpty) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => FilterScreen(images: _selectedImages),
//                   ),
//                 );
//               }
//             },
//             child: const Text('Next', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FilterScreen extends StatefulWidget {
//   final List<File> images;
//   const FilterScreen({super.key, required this.images});

//   @override
//   _FilterScreenState createState() => _FilterScreenState();
// }

// class _FilterScreenState extends State<FilterScreen> {
//   ColorFilter _selectedFilter =
//       const ColorFilter.mode(Colors.transparent, BlendMode.multiply);

//   List<ColorFilter> filters = [
//     const ColorFilter.mode(Colors.transparent, BlendMode.multiply),
//     ColorFilter.mode(Colors.purple.withOpacity(0.3), BlendMode.softLight),
//     ColorFilter.mode(Colors.blue.withOpacity(0.3), BlendMode.softLight),
//     ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.softLight),
//     ColorFilter.mode(Colors.orange.withOpacity(0.3), BlendMode.softLight),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Apply Filters')),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: widget.images.length,
//               itemBuilder: (context, index) => Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ColorFiltered(
//                   colorFilter: _selectedFilter,
//                   child: Image.file(widget.images[index], height: 200),
//                 ),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(filters.length, (index) {
//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _selectedFilter = filters[index];
//                   });
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.all(8),
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.black),
//                   ),
//                   child: ColorFiltered(
//                     colorFilter: filters[index],
//                     child: Container(color: Colors.grey),
//                   ),
//                 ),
//               );
//             }),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => HomeScreen(
//                       images: widget.images, filter: _selectedFilter),
//                 ),
//               );
//             },
//             child: const Text('Share', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   final List<File> images;
//   final ColorFilter filter;
//   const HomeScreen({super.key, required this.images, required this.filter});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Card(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//           elevation: 4,
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const ListTile(
//                   leading: CircleAvatar(child: Icon(Icons.person)),
//                   title: Text('John Karter',
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                   subtitle: Text('11 hours ago',
//                       style: TextStyle(color: Colors.grey)),
//                 ),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: CarouselSlider(
//                     options: CarouselOptions(
//                         height: 200,
//                         enlargeCenterPage: true,
//                         enableInfiniteScroll: false),
//                     items: images.map((image) {
//                       return Builder(
//                         builder: (BuildContext context) {
//                           return ColorFiltered(
//                             colorFilter: filter,
//                             child: Image.file(image,
//                                 fit: BoxFit.cover,
//                                 width: MediaQuery.of(context).size.width),
//                           );
//                         },
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Post App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const StartScreen(),
    );
  }
}
