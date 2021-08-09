import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pages extends StatelessWidget {
  final String title;
  final child;

  Pages({this.child, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: child,
        ),
      ),
    );
  }
}
