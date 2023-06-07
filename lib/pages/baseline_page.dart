import 'package:flutter/material.dart';
import 'package:app/type.dart';
import 'package:app/widgets/baseline_menu_control.dart';
import 'package:app/widgets/main_app_bar.dart';

class BaselinePage extends StatefulWidget implements HasLayoutGroup {
  const BaselinePage(
      {Key? key, required this.layoutGroup, required this.onLayoutToggle})
      : super(key: key);

  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  State<BaselinePage> createState() => _BaselinePageState();
}

class _BaselinePageState extends State<BaselinePage> {
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.start;

  void _updateCrossAxisAlignment(int index) {
    setState(() {
      _crossAxisAlignment = CrossAxisAlignment.values[index];
    });
  }

  Widget buildContent() {
    return Column(
      children: [
        Container(
          color: Colors.yellow,
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: _crossAxisAlignment,
            children: const [
              Text(
                'Flutter',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
              Text(
                'Layout',
                style: TextStyle(color: Colors.red, fontSize: 30),
              ),
              Text('is', style: TextStyle(color: Colors.purple, fontSize: 15)),
              Text(
                'Great',
                style: TextStyle(color: Colors.green, fontSize: 30),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildMenuControl() {
    return BaselineMenuControl(
        onUpdateCrossAxisAlignment: _updateCrossAxisAlignment);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(
          layoutGroup: widget.layoutGroup,
          layoutType: LayoutType.baseline,
          onLayoutToggle: widget.onLayoutToggle,
          bottom: PreferredSize(
            preferredSize: const Size(0, 160),
            child: buildMenuControl(),
          ),
        ),
        body: buildContent());
  }
}
