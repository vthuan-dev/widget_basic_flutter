import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  Map<String, bool> favorites = {};

  void toggleFavorite(String recipeTitle) {
    setState(() {
      favorites[recipeTitle] = !(favorites[recipeTitle] ?? false);
    });
  }

  Widget _buildRecipeCard(Recipe recipe) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(
            recipe.imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  recipe.description,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              favorites[recipe.title] ?? false 
                  ? Icons.favorite 
                  : Icons.favorite_border,
              color: favorites[recipe.title] ?? false 
                  ? Colors.red 
                  : Colors.grey,
            ),
            onPressed: () => toggleFavorite(recipe.title),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Món ăn'),
      ),
      body: ListView.builder(
        itemCount: Recipe.samples.length,
        itemBuilder: (context, index) {
          return _buildRecipeCard(Recipe.samples[index]);
        },
      ),
    );
  }
} 