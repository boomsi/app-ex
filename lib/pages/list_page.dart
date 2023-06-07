import 'package:flutter/material.dart';
import 'package:app/type.dart';

class ListPage extends StatefulWidget implements HasLayoutGroup {
  ListPage({Key? key, required this.layoutGroup, required this.onLayoutToggle})
      : super(key: key);
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('ListPage'));
  }
}
