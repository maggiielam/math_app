import 'package:flutter/material.dart';
import 'Keyboard.dart';
import 'Input.dart';

class Default extends StatelessWidget {
  ///
  /// The default page, which is the main page of the app.
  /// It contains the input (where math equations are typed) and the keyboard.
  ///

  const Default({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Input()),
        const Expanded(child: Keyboard()),
      ],
    );
  }
}
