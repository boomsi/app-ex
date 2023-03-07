import 'package:flutter/material.dart';
import './type.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  LayoutGroup _layoutGroup = LayoutGroup.nonScrollable; // 页面类型

  void _onSelectTab(int index) {}

  BottomNavigationBarItem _buildItem(
      {required IconData icon, required String text}) {
    return BottomNavigationBarItem(icon: Icon(icon), label: text);
  }

  Widget _buildBottomNavigationBar() {
    if (_layoutGroup == LayoutGroup.nonScrollable) {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          _buildItem(icon: Icons.view_headline, text: 'Row / Col'),
          _buildItem(icon: Icons.format_size, text: 'Baseline'),
          _buildItem(icon: Icons.layers, text: 'Stack'),
          _buildItem(icon: Icons.line_weight, text: 'Expanded'),
          _buildItem(icon: Icons.format_line_spacing, text: 'Padding'),
        ],
        onTap: _onSelectTab,
      );
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(icon: Icons.view_week, text: 'Page View'),
        _buildItem(icon: Icons.format_list_bulleted, text: 'List'),
        _buildItem(icon: Icons.view_day, text: 'Slivers'),
        _buildItem(icon: Icons.gradient, text: 'Hero'),
        _buildItem(icon: Icons.dashboard, text: 'Nested'),
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
