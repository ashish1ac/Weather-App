import 'package:flutter/material.dart';
import 'package:nine_clima/screens/loading_screen.dart';
import 'package:nine_clima/screens/location_screen.dart';
import 'package:nine_clima/services/location.dart';

void main() {
  runApp(ClimaApp());
}

class ClimaApp extends StatelessWidget {
  const ClimaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
