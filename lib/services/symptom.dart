import 'package:flutter/material.dart';

class Symptom {
  String name;
  IconData icon;
  Color color;

  Symptom(String name, IconData icon, Color color) {
    this.name = name;
    this.icon = icon;
    this.color = color;
  }
}
