import 'package:flutter/material.dart';

import 'navbar.dart';

class Layout extends StatelessWidget {
  Layout({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: NavBar(),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: child,
        ),
          ),
    );
  }
}
