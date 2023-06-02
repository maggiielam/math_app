import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'keyboard.dart';
import 'textfield.dart';
import 'main.dart';

class Default extends StatefulWidget {
  ///
  /// The default page, which is the main page of the app.
  /// It contains the input (where math equations are typed) and the keyboard.
  ///

  const Default({
    super.key,
  });

  @override
  State<Default> createState() => _DefaultState();
}

class _DefaultState extends State<Default> {
  bool _isLoading = true;
  // late TextFieldModel textFieldModel;

  @override
  void initState() {
    super.initState();
    dataLoad();
  }

  dataLoad() async {
    await Provider.of<TextFieldModel>(context, listen: false)
        .loadEquations(); // might be here
    setState(() {
      _isLoading =
          false; // your loader will stop to finish after the data fetch
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
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
