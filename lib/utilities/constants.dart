import 'package:flutter/material.dart';

const kTextStyleDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 8),
  prefixIcon: Icon(
    Icons.location_city_outlined,
    size: 30,
    color: Colors.blue,
  ),
  filled: true,
  fillColor: Colors.white12,
  hintText: 'Enter the City',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
);
