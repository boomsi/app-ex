import 'package:flutter/material.dart';
import 'package:app/type.dart';

class HeroHeader extends SliverPersistentHeaderDelegate {
  HeroHeader({
    required this.layoutGroup,
    required this.onLayoutToggle,
    required this.minExtent,
    required this.maxExtent,
  });

  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;
  double maxExtent;
  double minExtent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Stack(
      fit: StackFit.expand,
      children: const [],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class HeroPage extends StatefulWidget implements HasLayoutGroup {
  HeroPage({Key? key, required this.layoutGroup, required this.onLayoutToggle})
      : super(key: key);

  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  final List<String> assetNames = [
    'assets/brady-bellini-212790-unsplash.jpg',
    'assets/stefan-stefancik-105587-unsplash.jpg',
    'assets/simon-fitall-530083-unsplash.jpg',
    'assets/anton-repponen-99530-unsplash.jpg',
    'assets/kevin-cochran-524957-unsplash.jpg',
    'assets/samsommer-72299-unsplash.jpg',
    'assets/simon-matzinger-320332-unsplash.jpg',
    'assets/meng-ji-102492-unsplash.jpg',
  ];

  Widget _scrollView() {
    return Container(
      child: CustomScrollView(
        slivers: [
          // SliverPersistentHeader(
          //   pinned: true,
          //   delegate: HeroHeader(
          //       layoutGroup: widget.layoutGroup,
          //       onLayoutToggle: widget.onLayoutToggle,
          //       minExtent: 150,
          //       maxExtent: 250),
          // ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: 0.75),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  padding: _edgeInsetsForIndex(index),
                  child: Image.asset(assetNames[index % assetNames.length]),
                );
              },
              childCount: assetNames.length * 2,
            ),
          ),
        ],
      ),
    );
  }

  EdgeInsets _edgeInsetsForIndex(int index) {
    return index % 2 == 0
        ? const EdgeInsets.only(top: 4, left: 4, right: 4, bottom: 4)
        : const EdgeInsets.only(top: 4, left: 4, right: 4, bottom: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _scrollView());
  }
}
