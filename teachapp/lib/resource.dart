import 'package:flutter/material.dart';

class ResourcePage extends StatefulWidget {
  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  List<Widget> _resources = [];

  List<Widget> _getResources() {
    for (var i = 0; i < 5; i++) {
      _resources.add(
        ListTile(
          title: Text('resource'),
          leading: Icon(Icons.arrow_forward_outlined),
          tileColor: Colors.green,
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