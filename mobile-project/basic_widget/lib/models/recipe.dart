import 'package:flutter/material.dart';

//tạo class để lưu trữ các thông tin của mỗi món ăn
class Recipe {
  final String title;
  final String description;
  final String imageUrl;
// bên trong class Recipe có 3 thuộc tính title, description, imageUrl
  const Recipe({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  static List<Recipe> samples = [
    Recipe(
      title: 'Spaghetti Carbonara',
      description: 'Spaghetti with a creamy and rich bacon and egg sauce',
      imageUrl: 'https://www.marthastewart.com/thmb/S9xVtnWSHldvxPHKOxEq0bALG-k=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/MSL-338686-spaghetti-carbonara-hero-3x2-69999-560b45d1dd9f4741b717176eff024839.jpeg',
    ),
    Recipe(
      title: 'Tomato Soup',
      description: 'Tomato soup is a soup made with tomatoes as the primary ingredient',
      imageUrl: 'https://www.inspiredtaste.net/wp-content/uploads/2022/09/Roasted-Tomato-Soup-Recipe-1-1200.jpg',
    ),
    Recipe(
      title: 'Grilled Cheese',
      description: 'Grilled cheese is a sandwich made with two slices of bread and cheese',
      imageUrl: 'https://cdn.loveandlemons.com/wp-content/uploads/2023/01/grilled-cheese.jpg',
    ),
  ];
  
}