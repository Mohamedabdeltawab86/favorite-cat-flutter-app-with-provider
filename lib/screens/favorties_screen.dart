

import 'package:flutter/material.dart';
import 'package:like_cat/provider/cat_provider.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catProvider = Provider.of<CatProvider>(context);

    // final favoriteCats =
    //     catProvider.catList.where((cat) => cat.isLiked).toList();
    final favoriteCats = catProvider.catList.where((element) => element.isLiked).toList();

    return Scaffold(
      body: ListView.builder(
        itemCount: favoriteCats.length,
        itemBuilder: (context, index) {
          final cat = favoriteCats[index];
          return ListTile(
            title: Text(cat.name),
            trailing: IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () {
                catProvider.toggleLike(
                    catProvider.catList.indexOf(cat)); // Toggle like status
              },
            ),
          );
        },
      ),
    );
  }
}