import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  /// Simple list view currently as a space holder
  /// reserved for maggie's part
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [for (int i = 0; i < 10; i++) ListTile(title: Text("hi"))],
    );
  }
}
