import 'package:flutter/material.dart';
import 'package:app/type.dart';

class PaddingPage extends StatefulWidget implements HasLayoutGroup {
  PaddingPage(
      {Key? key, required this.layoutGroup, required this.onLayoutToggle})
      : super(key: key);
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  State<PaddingPage> createState() => _PaddingPageState();
}

class _PaddingPageState extends State<PaddingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('PaddingPage'),
    );
  }
}
