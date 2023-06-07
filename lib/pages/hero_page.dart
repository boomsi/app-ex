import 'package:flutter/material.dart';
import 'package:app/type.dart';

class HeroPage extends StatefulWidget implements HasLayoutGroup {
  HeroPage({Key? key, required this.layoutGroup, required this.onLayoutToggle})
      : super(key: key);

  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('HeroPage'),
    );
  }
}
