import 'package:app/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/type.dart';

class NestedPage extends StatefulWidget implements HasLayoutGroup {
  const NestedPage(
      {Key? key, required this.layoutGroup, required this.onLayoutToggle})
      : super(key: key);

  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  State<NestedPage> createState() => _NestedPageState();
}

class _NestedPageState extends State<NestedPage> {
  Widget _buildContent() {
    return ListView.builder(
      itemCount: 16,
      itemBuilder: (BuildContext context, index) {
        return _buildHorizontalList(pageIndex: index);
      },
    );
  }

  Widget _buildHorizontalList({required int pageIndex}) {
    final List<Color> colors = [
      Colors.green,
      Colors.blue,
      Colors.red,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
    ];
    double height = 136;
    return SizedBox(
        height: height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(
                index: index + 1,
                color: colors[(pageIndex + index) % colors.length],
                parentSize: height);
          },
        ));
  }

  Widget _buildItem(
      {required int index, required Color color, required double parentSize}) {
    double edgeSize = 8;
    double itemSize = parentSize - edgeSize * 2;
    return Container(
      padding: EdgeInsets.all(edgeSize),
      child: SizedBox(
        width: itemSize,
        height: itemSize,
        child: Container(
          alignment: AlignmentDirectional.center,
          color: color,
          child: Text(
            '$index',
            style: const TextStyle(fontSize: 72, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        layoutGroup: widget.layoutGroup,
        onLayoutToggle: widget.onLayoutToggle,
        layoutType: LayoutType.nested,
      ),
      body: Container(
        child: _buildContent(),
      ),
    );
  }
}
