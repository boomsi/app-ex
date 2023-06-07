import 'package:flutter/material.dart';
import './type.dart';
import 'package:app/pages/row_column_page.dart';
import 'package:app/pages/page_view_page.dart';
import 'package:app/pages/baseline_page.dart';
import 'package:app/pages/stack_page.dart';
import 'package:app/pages/expanded_page.dart';
import 'package:app/pages/padding_page.dart';
import 'package:app/pages/list_page.dart';
import 'package:app/pages/slivers_page.dart';
import 'package:app/pages/hero_page.dart';
import 'package:app/pages/nested_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  LayoutGroup _layoutGroup = LayoutGroup.nonScrollable;
  LayoutType _layoutSelection1 = LayoutType.stack;
  LayoutType _layoutSelection2 = LayoutType.pageView;
  LayoutType get _layoutSelection => _layoutGroup == LayoutGroup.nonScrollable
      ? _layoutSelection1
      : _layoutSelection2;

  void _onSelectTab(int index) {
    setState(() {
      if (_layoutGroup == LayoutGroup.nonScrollable) {
        _layoutSelection1 = LayoutType.values[index];
      } else {
        _layoutSelection2 = LayoutType.values[index + 5];
      }
    });
  }

  void _onLayoutGroupToggle() {
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

  Widget _buildBottomNavigationBar() {
    if (_layoutGroup == LayoutGroup.nonScrollable) {
      return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          currentIndex: _layoutGroup == LayoutGroup.nonScrollable
              ? LayoutType.values.indexOf(_layoutSelection)
              : LayoutType.values.indexOf(_layoutSelection) - 5,
          items: [
            _buildItem(
                icon: Icons.view_headline,
                layoutSelection: LayoutType.rowColumn),
            _buildItem(
                icon: Icons.format_size, layoutSelection: LayoutType.baseline),
            _buildItem(icon: Icons.layers, layoutSelection: LayoutType.stack),
            _buildItem(
                icon: Icons.line_weight, layoutSelection: LayoutType.expanded),
            _buildItem(
                icon: Icons.format_line_spacing,
                layoutSelection: LayoutType.padding),
          ],
          onTap: _onSelectTab);
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
      LayoutType.baseline: (_) => BaselinePage(
          layoutGroup: _layoutGroup, onLayoutToggle: _onLayoutGroupToggle),
      LayoutType.stack: (_) => StackPage(
            layoutGroup: _layoutGroup,
            onLayoutToggle: _onLayoutGroupToggle,
          ),
      LayoutType.expanded: (_) => ExpandedPage(
            layoutGroup: _layoutGroup,
            onLayoutToggle: _onLayoutGroupToggle,
          ),
      LayoutType.padding: (_) => PaddingPage(
            layoutGroup: _layoutGroup,
            onLayoutToggle: _onLayoutGroupToggle,
          ),
      LayoutType.pageView: (_) => PageViewPage(
            layoutGroup: _layoutGroup,
            onLayoutToggle: _onLayoutGroupToggle,
          ),
      LayoutType.list: (_) => ListPage(
            layoutGroup: _layoutGroup,
            onLayoutToggle: _onLayoutGroupToggle,
          ),
      LayoutType.slivers: (_) => SliversPage(
            layoutGroup: _layoutGroup,
            onLayoutToggle: _onLayoutGroupToggle,
          ),
      LayoutType.hero: (_) => HeroPage(
            layoutGroup: _layoutGroup,
            onLayoutToggle: _onLayoutGroupToggle,
          ),
      LayoutType.nested: (_) => NestedPage(
            layoutGroup: _layoutGroup,
            onLayoutToggle: _onLayoutGroupToggle,
          )
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
