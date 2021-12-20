import 'package:demo/screens/home.dart';
import 'package:demo/screens/details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
      // home: DetailsScreen(),
    )
  );
}

