import 'package:flutter/material.dart';

import 'new_post_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewPostScreen()),
            );
          },
          child: const Text('Start', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
