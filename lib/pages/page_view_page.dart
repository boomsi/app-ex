import 'package:flutter/material.dart';
import 'package:app/type.dart';

class PageViewPage extends StatefulWidget implements HasLayoutGroup {
  // PageViewPage(
  //     {super.key, required this.layoutGroup, required this.onLayoutToggle});

  PageViewPage(
      {Key? key, required this.layoutGroup, required this.onLayoutToggle})
      : super(key: key);

  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('PageViewPage'),
    );
  }
}
