import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'globals.dart' as gs;

keyFunct(int x) async {
  String ky = gs.keys[x];
  List<String> eq = await getEQ();
  if (x == 14) {
    if (eq[0].isNotEmpty) {
      eq[0] = eq[0].substring(0, eq[0].length - 1);
    }
  } else if (x == 18) {
    eq.insert(1, eq[0]);
    eq[0] = '';
    if (eq.length == 5 && !gs.initDeleted) {
      eq.removeLast();
      eq.removeLast();
      gs.initDeleted = true;
    }
  } else if (x == 19) {
    eq[0] = '';
  } else if (x == 3) {
    eq[0] += "*";
  } else {
    print(x);
    eq[0] += ky;
  }
  saveEQ(eq);
}

void saveTF(List<String> tf) async {
  /// Saves the key configuration into shared preferences (the main storage)
  print("save tf");
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setStringList('mathTextField', tf);
}

void clearTF() {
  /// Clears all past data in shared preferences (the main storage)
  SharedPreferences.getInstance()
      .then((prefs) => prefs.remove('mathTextField'));
}

Future<List<String>> getTF() async {
  /// Gets the key configuration from shared preferences (the main storage)
  print("get TF");
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Retrieve the list of JSON strings from shared preferences
  List<String>? tfStrings = prefs.getStringList('mathTextField');
  // print(buttonStrings);
  // If the list is null or empty, return an empty list
  if (tfStrings == null || tfStrings.isEmpty) {
    return ['', '', ''];
  }

  return tfStrings;
}

void saveEQ(List<String> eq) async {
  /// Saves the key configuration into shared preferences (the main storage)
  print("save eq");
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setStringList('mathEquations', eq);
}

void clearEQ() {
  /// Clears all past data in shared preferences (the main storage)
  SharedPreferences.getInstance()
      .then((prefs) => prefs.remove('mathEquations'));
}

Future<List<String>> getEQ() async {
  /// Gets the key configuration from shared preferences (the main storage)
  print("get EQ");
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Retrieve the list of JSON strings from shared preferences
  List<String>? eqStrings = prefs.getStringList('mathEquations');
  // print(buttonStrings);
  // If the list is null or empty, return an empty list
  if (eqStrings == null || eqStrings.isEmpty) {
    return ['', '', ''];
  }

  return eqStrings;
}
