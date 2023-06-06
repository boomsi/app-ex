import 'package:flutter/material.dart';
import './type.dart';
import 'package:app/pages/row_column_page.dart';
import 'package:app/pages/page_view_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  LayoutGroup _layoutGroup = LayoutGroup.nonScrollable;
  LayoutType _layoutSelection1 = LayoutType.rowColumn;
  LayoutType _layoutSelection2 = LayoutType.pageView;
  LayoutType get _layoutSelection => _layoutGroup != LayoutGroup.nonScrollable
      ? _layoutSelection1
      : _layoutSelection2;

  void _onSelectTab(int index) {
    setState(() {
      _layoutGroup = _layoutGroup == LayoutGroup.nonScrollable
          ? LayoutGroup.scrollable
          : LayoutGroup.nonScrollable;
    });
  }

  BottomNavigationBarItem _buildItem(
      {required IconData icon, required LayoutType layoutSelection}) {
    String text = layoutNames[layoutSelection] ?? '';
    return BottomNavigationBarItem(icon: Icon(icon), label: text);
  }

  void _onLayoutGroupToggle() {
    setState(() {
      _layoutGroup = _layoutGroup == LayoutGroup.nonScrollable
          ? LayoutGroup.scrollable
          : LayoutGroup.nonScrollable;
    });
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

  Widget? _buildBody() {
    return {
      LayoutType.rowColumn: (_) => RowColumnPage(
            layoutGroup: _layoutGroup,
            onLayoutToggle: _onLayoutGroupToggle,
          ),
      LayoutType.baseline: (_) => null,
      LayoutType.stack: (_) => null,
      LayoutType.expanded: (_) => null,
      LayoutType.padding: (_) => null,
      LayoutType.pageView: (_) => PageViewPage(
            layoutGroup: _layoutGroup,
            onLayoutToggle: _onLayoutGroupToggle,
          ),
      LayoutType.list: (_) => null,
      LayoutType.slivers: (_) => null,
      LayoutType.hero: (_) => null,
      LayoutType.nested: (_) => null,
    }[_layoutSelection]
        ?.call(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _buildBody(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
