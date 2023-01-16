import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopping_bag/constants.dart';
import 'package:shopping_bag/screens/homepage.dart';

void main() {
  runApp(ProviderScope(child: ShoppingBag()));
}

class ShoppingBag extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
