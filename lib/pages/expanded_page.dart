import 'package:app/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/type.dart';

class ExpandedPage extends StatefulWidget implements HasLayoutGroup {
  const ExpandedPage(
      {Key? key, required this.layoutGroup, required this.onLayoutToggle})
      : super(key: key);

  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  State<ExpandedPage> createState() => _ExpandedPageState();
}

class _ExpandedPageState extends State<ExpandedPage> {
  Size _goldenRatio(BoxConstraints constraints) {
    double ratio = 13 / 8;
    if (constraints.maxHeight / constraints.maxWidth > ratio) {
      return Size(constraints.maxWidth, constraints.maxHeight * ratio);
    } else {
      return Size(constraints.maxWidth / ratio, constraints.maxHeight);
    }
  }

  Widget _centerLayout({Widget? child}) {
    return LayoutBuilder(builder: (content, constraints) {
      Size size = _goldenRatio(constraints);
      return Center(
        child: Container(
          constraints:
              BoxConstraints(maxHeight: size.height, maxWidth: size.width),
          child: child,
        ),
      );
    });
  }

  Widget _buildBox({required int flex, required Color color}) {
    return Expanded(flex: flex, child: Container(color: color));
  }

  Widget _buildContent() {
    return Column(
      children: [
        _buildBox(flex: 8, color: Colors.yellow),
        Expanded(
          flex: 5,
          child: Row(
            children: [
              _buildBox(flex: 5, color: Colors.red),
              Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Expanded(
                                      child: Column(
                                children: [
                                  _buildBox(flex: 1, color: Colors.grey),
                                  _buildBox(flex: 1, color: Colors.pink)
                                ],
                              ))),
                              _buildBox(flex: 2, color: Colors.green)
                            ],
                          )),
                      _buildBox(flex: 3, color: Colors.blue)
                    ],
                  ))
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(
          layoutGroup: widget.layoutGroup,
          onLayoutToggle: widget.onLayoutToggle,
          layoutType: LayoutType.expanded,
        ),
        body: _centerLayout(child: _buildContent()));
  }
}
