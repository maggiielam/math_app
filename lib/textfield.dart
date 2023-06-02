import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'keyfunct.dart';

class Textfield extends StatefulWidget {
  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  /// Simple list view currently as a space holder
  /// reserved for maggie's part
  bool _isLoading = false;
  bool _ = false;
  List<String> eq = [];
  @override
  void initState() {
    print("awesome");
    super.initState();
    dataLoad();
  }

  void dataLoad() async {
    setState(() {
      _isLoading = true; // your loader has started to load
    });
    List<String> q = await getEQ(); // might be here
    setState(() {
      eq = q;
      _isLoading =
          false; // your loader will stop to finish after the data fetch
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Consumer<TextFieldModel>(
            builder: (context, model, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // ...
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Math.tex(model.equations[2],
                        mathStyle: MathStyle.display,
                        textStyle: TextStyle(fontSize: 40)),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Math.tex(model.equations[1],
                        mathStyle: MathStyle.display,
                        textStyle: TextStyle(fontSize: 40)),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Math.tex(model.equations[0],
                        mathStyle: MathStyle.display,
                        textStyle: TextStyle(fontSize: 40)),
                  ),
                ],
              );
            },
          );
  }
}
