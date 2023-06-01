import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AKey extends StatelessWidget {
  /// The most basic wdiget of the app
  /// shape, color, keyvalue, and keyface are stored
  /// Json methods are implemented for the storing process
  final String shape;
  final Color color;
  final String keyValue;
  final String keyFace;
  final Key key;
  final Map shapes = {
    "rect": RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    )
  };

  AKey({
    required this.shape,
    required this.color,
    required this.keyValue,
    required this.keyFace,
    required this.key,
  });

  factory AKey.fromJson(Map<String, dynamic> json) {
    return AKey(
      shape: json['shape'],
      color: Color(json['color']),
      keyValue: json['keyValue'],
      keyFace: json['keyFace'],
      key: ValueKey(json['keyValue']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shape': shape,
      'color': color.value,
      'keyValue': keyValue,
      'keyFace': keyFace,
    };
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: shapes[shape],
        primary: color,
      ),
      onPressed: () {},
      child: Text(keyFace),
    );
  }
}

void saveConfig(List<AKey> key) async {
  /// Saves the key configuration into shared preferences (the main storage)
  print("save config");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> buttonStrings =
      key.map((ky) => json.encode(ky.toJson())).toList();

  prefs.setStringList('buttonConfig', buttonStrings);
}

void clear() {
  /// Clears all past data in shared preferences (the main storage)
  SharedPreferences.getInstance().then((prefs) => prefs.clear());
}

Future<List<AKey>> getConfig() async {
  /// Gets the key configuration from shared preferences (the main storage)
  print("get config");
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Retrieve the list of JSON strings from shared preferences
  List<String>? buttonStrings = prefs.getStringList('buttonConfig');
  // print(buttonStrings);
  // If the list is null or empty, return an empty list
  if (buttonStrings == null || buttonStrings.isEmpty) {
    return [];
  }

  // Convert each JSON string back to a AKey object
  List<AKey> buttons = buttonStrings.map((buttonString) {
    Map<String, dynamic> buttonJson = json.decode(buttonString);
    return AKey.fromJson(buttonJson);
  }).toList();

  return buttons;
}

Future<List<AKey>> getInitial() async {
  /// Gets the initial key configuration from shared preferences (the main storage)
  /// Has safety for if the main storage is empty (essentially where the default keyboard is initialized)
  List<AKey> keys = await getConfig();
  if (keys.isEmpty) {
    List<AKey> newKeys = [];
    int n = 40;
    // subject to change based on screen ratio, etc
    for (int i = 0; i < n; i++) {
      newKeys.add(AKey(
        color: Colors.blue,
        keyFace: i.toString(),
        keyValue: i.toString(),
        key: ValueKey(i.toString()),
        shape: "rect",
      ));
    }
    saveConfig(newKeys);
    return newKeys;
  } else {
    return keys;
  }
}
