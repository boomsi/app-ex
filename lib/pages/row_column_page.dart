import 'package:app/widgets/main_app_bar.dart';
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
  bool _isRow = true;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.center;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;
  MainAxisSize _mainAxisSize = MainAxisSize.max;
  VerticalDirection _verticalDirection = VerticalDirection.down;

  Widget buildContent() {
    return _isRow
        ? Row(
            mainAxisAlignment: _mainAxisAlignment,
            crossAxisAlignment: _crossAxisAlignment,
            mainAxisSize: _mainAxisSize,
            verticalDirection: _verticalDirection,
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
            verticalDirection: _verticalDirection,
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
      ),
      body: Container(
        color: Colors.blue,
        child: buildContent(),
      ),
    );
  }
}
