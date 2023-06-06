import 'package:flutter/material.dart';
import 'package:app/type.dart';

class RowColumnPage extends StatefulWidget implements HasLayoutGroup {
  // RowColumnPage({super.key, required layoutGroup, required onLayoutToggle});
  RowColumnPage(
      {Key? key, required this.layoutGroup, required this.onLayoutToggle})
      : super(key: key);

  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  State<RowColumnPage> createState() => _RowColumnPageState();
}

class _RowColumnPageState extends State<RowColumnPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('RowColumnPage'),
    );
  }
}
