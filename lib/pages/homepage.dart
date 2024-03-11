import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/layout.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Text('Welcome to the Home Page!'),
    );
  }
}