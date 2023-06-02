import 'package:flutter/material.dart';
import 'package:keyboard_01/keyfunct.dart';
import 'package:provider/provider.dart';

import 'default.dart';
import 'editkeys.dart';
import 'akey.dart';

// class AppModel extends ChangeNotifier {
//   List<String> _keys;
//   List<String> get keys => _keys;

//   AppModel() : _keys = ['', '', ''];

//   void setKeys(List<String> k) {
//     _keys = k;
//     notifyListeners();
//   }
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ritvik\'s App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Ritvik\'s App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    Widget page = const Default();
    if (index == 0) {
      page = const Default();
    } else if (index == 1) {
      page = const EditKeys();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          // edit button -> goes to editpage (editkeys.dart)
          Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  if (index == 0) {
                    setState(() => index = 1);
                  } else if (index == 1) {
                    setState(() => index = 0);
                  }
                },
              )),
          // refresh button -> clears the data, only available on edit page
          Visibility(
            visible: index == 1,
            child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    clearKeyConfig();
                    setState(() => index = 0);
                  },
                )),
          ),
        ],
      ),
      // etiher the default page or the edit page
      body: ChangeNotifierProvider(
          create: (context) => TextFieldModel(), child: page),
    );
  }
}

class TextFieldModel extends ChangeNotifier {
  List<String> equations = [];

  void setEquations(List<String> newEquations) {
    equations = newEquations;
    notifyListeners();
  }

  Future<void> loadEquations() async {
    equations = await getEQ();
    notifyListeners();
  }
}
