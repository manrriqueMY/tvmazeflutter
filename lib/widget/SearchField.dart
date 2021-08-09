import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final onChanged;
  SearchField({this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter a search',
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
