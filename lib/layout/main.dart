import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  static String routeName = '/layout';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2333',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row / Col'),
        ),
        body: Text('20'),
      ),
    );
  }
}
