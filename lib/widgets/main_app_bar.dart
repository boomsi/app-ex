import 'package:app/type.dart';
import 'package:flutter/material.dart';

class MainAppBar extends AppBar {
  MainAppBar({
    required LayoutGroup layoutGroup,
    required LayoutType layoutType,
    required VoidCallback onLayoutToggle,
    PreferredSize? bottom,
  }) : super(
            leading: IconButton(
                onPressed: onLayoutToggle,
                icon: Icon(layoutGroup == LayoutGroup.nonScrollable
                    ? Icons.view_agenda
                    : Icons.view_carousel)),
            title: Text(layoutNames[layoutType] ?? ''),
            elevation: 1.0,
            bottom: bottom);
}
