import 'package:flutter/material.dart';
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
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                // SizedBox(height: 60,),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Math.tex(eq[2],
                        mathStyle: MathStyle.display,
                        textStyle: TextStyle(fontSize: 40))),

                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Math.tex(eq[1],
                        mathStyle: MathStyle.display,
                        textStyle: TextStyle(fontSize: 40))),

                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Math.tex(eq[0],
                        mathStyle: MathStyle.display,
                        textStyle: TextStyle(fontSize: 40))),
              ]);
  }
}
