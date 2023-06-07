import 'package:flutter/material.dart';
import 'package:app/type.dart';

class NestedPage extends StatefulWidget implements HasLayoutGroup {
  NestedPage(
      {Key? key, required this.layoutGroup, required this.onLayoutToggle})
      : super(key: key);

  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  State<NestedPage> createState() => _NestedPageState();
}

class _NestedPageState extends State<NestedPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('NestedPage'),
    );
  }
}
