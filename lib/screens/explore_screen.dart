import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Khám phá'),
      ),
      body: Center(
        child: Text('Nội dung khám phá'),
      ),
    );
  }
} 