import 'package:flutter/material.dart';
import 'package:app/type.dart';
import 'package:app/widgets/main_app_bar.dart';

class PageViewPage extends StatefulWidget implements HasLayoutGroup {
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
    return Scaffold(
      appBar: MainAppBar(
          layoutGroup: widget.layoutGroup,
          layoutType: LayoutType.pageView,
          onLayoutToggle: widget.onLayoutToggle),
    );
  }
}
