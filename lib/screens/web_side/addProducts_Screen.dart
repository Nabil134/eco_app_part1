import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  static const String id = 'addproduct';
  AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Add Product Screen'),
      ),
    );
  }
}
