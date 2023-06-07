import 'package:app/type.dart';
import 'package:flutter/material.dart';

class BaselinePage extends StatefulWidget implements HasLayoutGroup {
  BaselinePage(
      {Key? key, required this.layoutGroup, required this.onLayoutToggle})
      : super(key: key);

  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  State<BaselinePage> createState() => _BaselinePageState();
}

class _BaselinePageState extends State<BaselinePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('BaselinePage'),
    );
  }
}
