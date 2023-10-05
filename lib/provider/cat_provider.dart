import 'package:flutter/material.dart';
import 'package:like_cat/model/cat.dart';

class CatProvider with ChangeNotifier {
  final List<Cat> _catList = [
    Cat('Whiskers', false),
    Cat('Mittens', false),
    Cat('Socks', false),
    Cat('Fluffy', false),
    Cat('Oreo', false),
    Cat('Simba', false),
    Cat('Luna', false),
    Cat('Tiger', false),
    Cat('Cleo', false),
    Cat('Shadow', false),
  ];

  List<Cat> get catList => _catList;

  void toggleLike(int index) {
    _catList[index].isLiked = !_catList[index].isLiked;
  }
}
