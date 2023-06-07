import 'package:app/widgets/stack_menu_control.dart';
import 'package:flutter/material.dart';
import 'package:app/type.dart';
import 'package:app/widgets/main_app_bar.dart';

class StackPage extends StatefulWidget implements HasLayoutGroup {
  const StackPage(
      {Key? key, required this.layoutGroup, required this.onLayoutToggle})
      : super(key: key);

  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  State<StackPage> createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  bool _useAlignment = false;
  Alignment _alignmentDirectional = Alignment.topLeft;

  void _updateAlignment(int index) {
    setState(() {
      _useAlignment = index == 1;
    });
  }

  void _updateAlignmentDirectional(int index) {
    const Map<String, Alignment> alignmentDict = {
      'topLeft': Alignment.topLeft,
      'topCenter': Alignment.topCenter,
      'topRight': Alignment.topRight,
      'centerLeft': Alignment.centerLeft,
      'center': Alignment.center,
      'centerRight': Alignment.centerRight,
      'bottomLeft': Alignment.bottomLeft,
      'bottomCenter': Alignment.bottomCenter,
      'bottomRight': Alignment.bottomRight,
    };

    setState(() {
      _alignmentDirectional = alignmentDict.values.toList()[index];
    });
  }

  Widget buildContent() {
    return _useAlignment
        ? Stack(
            alignment: _alignmentDirectional,
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: Container(
                  color: Colors.green,
                ),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Container(
                  color: Colors.red,
                ),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Container(
                  color: Colors.yellow,
                ),
              )
            ],
          )
        : Stack(
            alignment: _alignmentDirectional,
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: Container(color: Colors.blue),
              ),
              Positioned(
                left: 40,
                top: 40,
                width: 100,
                height: 100,
                child: Container(color: Colors.yellow),
              ),
              Positioned(
                right: 40,
                top: 40,
                width: 100,
                height: 100,
                child: Container(color: Colors.green),
              ),
              Positioned(
                left: 40,
                bottom: 40,
                height: 100,
                width: 100,
                child: Container(color: Colors.purple),
              ),
              Positioned(
                right: 40,
                bottom: 40,
                height: 100,
                width: 100,
                child: Container(color: Colors.pink),
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        layoutGroup: widget.layoutGroup,
        onLayoutToggle: widget.onLayoutToggle,
        layoutType: LayoutType.stack,
        bottom: PreferredSize(
          preferredSize: const Size(0, 80),
          child: StackMenuControl(
            useAlignment: _useAlignment,
            alignDirectional: _alignmentDirectional,
            onAlignmentChange: _updateAlignment,
            onAlignmentDirectionalChange: _updateAlignmentDirectional,
          ),
        ),
      ),
      body: Center(child: buildContent()),
    );
  }
}
