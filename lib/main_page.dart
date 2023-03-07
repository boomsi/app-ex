import 'package:flutter/material.dart';
import './type.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final LayoutGroup _layoutGroup = LayoutGroup.nonScrollable;

  void _onSelectTab(int index) {}

  BottomNavigationBarItem _buildItem(
      {required IconData icon, required LayoutType layoutSelection}) {
    String text = layoutNames[layoutSelection] ?? '';
    return BottomNavigationBarItem(icon: Icon(icon), label: text);
  }

  Widget _buildBottomNavigationBar() {
    if (_layoutGroup == LayoutGroup.nonScrollable) {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          _buildItem(
              icon: Icons.view_headline, layoutSelection: LayoutType.rowColumn),
          _buildItem(
              icon: Icons.format_size, layoutSelection: LayoutType.baseline),
          _buildItem(icon: Icons.layers, layoutSelection: LayoutType.stack),
          _buildItem(
              icon: Icons.line_weight, layoutSelection: LayoutType.expanded),
          _buildItem(
              icon: Icons.format_line_spacing,
              layoutSelection: LayoutType.padding),
        ],
        onTap: _onSelectTab,
      );
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(icon: Icons.view_week, layoutSelection: LayoutType.pageView),
        _buildItem(
            icon: Icons.format_list_bulleted, layoutSelection: LayoutType.list),
        _buildItem(icon: Icons.view_day, layoutSelection: LayoutType.slivers),
        _buildItem(icon: Icons.gradient, layoutSelection: LayoutType.hero),
        _buildItem(icon: Icons.dashboard, layoutSelection: LayoutType.nested),
      ],
      onTap: _onSelectTab,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('222'),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
