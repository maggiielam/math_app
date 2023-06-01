import 'package:flutter/material.dart';
import 'akey.dart';

class Keyboard extends StatefulWidget {
  // the keyboard, each key is "AKey
  const Keyboard({
    super.key,
  });

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  bool _isLoading = false;

  List<AKey> keys = [];

  @override
  void initState() {
    super.initState();
    dataLoad();
  }

  dataLoad() async {
    setState(() {
      _isLoading = true; // your loader has started to load
    });
    List<AKey> k = await getInitial(); // might be here
    setState(() {
      keys = k;
      _isLoading =
          false; // your loader will stop to finish after the data fetch
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.count(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 5, // will change eventually
              children: keys,
            ),
      // floatingActionButton: FloatingActionButton(onPressed: () => dataLoad()),
    );
  }
}
