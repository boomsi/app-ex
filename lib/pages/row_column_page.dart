import 'package:flutter/material.dart';
import 'package:app/widgets/main_app_bar.dart';
import 'package:app/type.dart';
import 'package:app/widgets/row_column_menu_control.dart';

class RowColumnPage extends StatefulWidget implements HasLayoutGroup {
  // RowColumnPage({super.key, required layoutGroup, required onLayoutToggle});
  const RowColumnPage(
      {Key? key, required this.layoutGroup, required this.onLayoutToggle})
      : super(key: key);

  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  State<RowColumnPage> createState() => _RowColumnPageState();
}

class _RowColumnPageState extends State<RowColumnPage> {
  bool _isRow = true;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.center;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;
  MainAxisSize _mainAxisSize = MainAxisSize.max;

  void _updateLayout(int index) {
    setState(() {
      _isRow = index == 0;
    });
  }

  void _updateMainAxisAlignment(int index) {
    setState(() {
      _mainAxisAlignment = MainAxisAlignment.values[index];
    });
  }

  void _updateCrossAxisAlignment(int index) {
    setState(() {
      _crossAxisAlignment = CrossAxisAlignment.values[index];
    });
  }

  void _updateMainAxisSize(int index) {
    setState(() {
      _mainAxisSize = MainAxisSize.values[index];
    });
  }

  Widget buildMenuControl() {
    return RowColumnMenuControl(
      onUpdateCrossAxisAlignment: _updateCrossAxisAlignment,
      onUpdateLayout: _updateLayout,
      onUpdateMainAxisAlignment: _updateMainAxisAlignment,
      onUpdateMainAxisSize: _updateMainAxisSize,
    );
  }

  Widget buildContent() {
    return _isRow
        ? Row(
            mainAxisAlignment: _mainAxisAlignment,
            crossAxisAlignment: _crossAxisAlignment,
            mainAxisSize: _mainAxisSize,
            children: const [
              Icon(Icons.stars, size: 50),
              Icon(Icons.stars, size: 100),
              Icon(Icons.stars, size: 50),
            ],
          )
        : Column(
            mainAxisAlignment: _mainAxisAlignment,
            crossAxisAlignment: _crossAxisAlignment,
            mainAxisSize: _mainAxisSize,
            children: const [
              Icon(Icons.stars, size: 50),
              Icon(Icons.stars, size: 100),
              Icon(Icons.stars, size: 50),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        layoutGroup: widget.layoutGroup,
        layoutType: LayoutType.rowColumn,
        onLayoutToggle: widget.onLayoutToggle,
        bottom: PreferredSize(
          preferredSize: const Size(0.0, 160.0),
          child: buildMenuControl(),
        ),
      ),
      body: Container(
        color: Colors.blue,
        child: buildContent(),
      ),
    );
  }
}
