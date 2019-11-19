
import 'package:flutter/material.dart';
import 'user.dart';

class Invention {
  String name;
  List<User> inventors;
  double progress;
  List<User> investors;
  String category;
  AssetImage image;

  Invention(String name, List<User> inventors, List<User> investors, double progress, String category, AssetImage image) {
    this.name = name;
    this.inventors = inventors;
    this.investors = investors;
    this.progress = progress;
    this.category = category;
    this.image = image;
  }
}