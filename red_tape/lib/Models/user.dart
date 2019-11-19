import 'package:flutter/material.dart';

import 'invention.dart';
class User {
  String firstName;
  String lastName;
  List<Invention> inventions;
  AssetImage profilePic;

  User(String firstName, String lastName, List<Invention> inventions, AssetImage profilePic) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.inventions = inventions;
    this.profilePic = profilePic;
  }
}