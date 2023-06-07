import 'package:flutter/material.dart';
import 'package:app/type.dart';

class StackPage extends StatefulWidget implements HasLayoutGroup {
  StackPage({Key? key, required this.layoutGroup, required this.onLayoutToggle})
      : super(key: key);

  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  State<StackPage> createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('StackPage'),
    );
  }
}
