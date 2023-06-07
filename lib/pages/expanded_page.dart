import 'package:flutter/material.dart';
import 'package:app/type.dart';

class ExpandedPage extends StatefulWidget implements HasLayoutGroup {
  ExpandedPage(
      {Key? key, required this.layoutGroup, required this.onLayoutToggle})
      : super(key: key);

  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  State<ExpandedPage> createState() => _ExpandedPageState();
}

class _ExpandedPageState extends State<ExpandedPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('ExpandedPage'),
    );
  }
}
