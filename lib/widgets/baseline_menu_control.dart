import 'package:flutter/material.dart';
import 'package:app/widgets/layout_arrtibute_selector.dart';

class BaselineMenuControl extends StatelessWidget {
  const BaselineMenuControl(
      {Key? key, required this.onUpdateCrossAxisAlignment})
      : super(key: key);

  final ValueChanged<int> onUpdateCrossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: LayoutAttributeSelector(
              title: 'baseline',
              values: const ['start', 'end', 'center'],
              onChange: onUpdateCrossAxisAlignment),
        )
      ],
    );
  }
}
