import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'keyboard.dart';
import 'textfield.dart';
import 'main.dart';

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
        Expanded(flex: 1, child: Textfield()),
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
