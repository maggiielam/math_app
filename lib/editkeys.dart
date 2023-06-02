import 'package:flutter/material.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'akey.dart';

class EditKeys extends StatefulWidget {
  ///
  /// Page to edit the keys
  /// Can reset the keys on this page
  /// keys are rearrangeable

  const EditKeys({
    super.key,
  });

  @override
  State<EditKeys> createState() => _EditKeysState();
}

class _EditKeysState extends State<EditKeys> {
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
    List<AKey> ky = await getInitial();

    setState(() {
      keys = ky;
      _isLoading =
          false; // your loader will stop to finish after the data fetch
    });
  }

  saveData() async {
    setState(() => _isLoading = true);
    saveConfig(keys);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: ReorderableGridView.count(
                      shrinkWrap: true,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 10, // will change eventually
                      children: keys,
                      onReorder: (oldIndex, newIndex) {
                        setState(() {
                          final element = keys.removeAt(oldIndex);
                          keys.insert(newIndex, element);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveData,
        splashColor: Colors.red,
        child: const Icon(Icons.save),
      ),
    );
  }
}
