import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmazeflutter/layouts/Draw.dart';
import 'package:tvmazeflutter/layouts/Navigate.dart';

class App extends StatelessWidget {
  final currentIndex;
  final onTap;
  final child;

  App({this.child, this.currentIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TV MAZE"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: child,
        ),
      ),
      endDrawer: Draw(),
      bottomNavigationBar: Navigate(
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }
}
