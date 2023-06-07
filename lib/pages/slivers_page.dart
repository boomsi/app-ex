import 'package:flutter/material.dart';
import 'package:app/type.dart';

class SliversPage extends StatefulWidget implements HasLayoutGroup {
  SliversPage(
      {Key? key, required this.layoutGroup, required this.onLayoutToggle})
      : super(key: key);
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  State<SliversPage> createState() => _SliversPageState();
}

class _SliversPageState extends State<SliversPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('SliverPage'),
    );
  }
}
