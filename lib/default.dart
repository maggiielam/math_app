import 'package:flutter/material.dart';
import 'keyboard.dart';
import 'input.dart';

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
        Expanded(flex: 1, child: Input()),
        const Expanded(
            flex: 2,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Keyboard(),
                ),
              ],
            ))),
      ],
    );
  }
}
