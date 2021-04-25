import 'package:flutter/material.dart';
import 'globals.dart';

class ResourcePage extends StatefulWidget {
  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  List<Widget> _resources = [];

  Future<void> _showMyDialog(String message, String title) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Done'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

  List<Widget> _getResources() {
    for (var resource in resources) {
      _resources.add(
        ListTile(
          title: Text(resource[0]),
          leading: Icon(Icons.arrow_forward_outlined),
          tileColor: Colors.transparent,
          onTap: () {
            _showMyDialog(resource[1], resource[0]);
          },
        ),
      );
    }
  }

  _ResourcePageState() {
    _getResources();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: _resources,
      ),
    );
  }
}