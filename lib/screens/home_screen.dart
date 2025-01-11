import 'package:flutter/material.dart';
import 'recipe_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Trang chủ'),
        ),
        body: const Center(
          child: Text(
            'Nội dung trang chủ',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
} 