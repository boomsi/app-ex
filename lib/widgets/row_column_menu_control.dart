import 'package:flutter/material.dart';
import 'package:app/widgets/layout_arrtibute_selector.dart';

class RowColumnMenuControl extends StatelessWidget {
  const RowColumnMenuControl(
      {Key? key,
      required this.onUpdateLayout,
      required this.onUpdateMainAxisAlignment,
      required this.onUpdateCrossAxisAlignment,
      required this.onUpdateMainAxisSize})
      : super(key: key);

  final ValueChanged<int> onUpdateLayout;
  final ValueChanged<int> onUpdateMainAxisAlignment;
  final ValueChanged<int> onUpdateCrossAxisAlignment;
  final ValueChanged<int> onUpdateMainAxisSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              LayoutAttributeSelector(
                  title: 'Layout',
                  values: const ['row', 'column'],
                  onChange: onUpdateLayout),
              LayoutAttributeSelector(
                  title: 'Main Axis Size',
                  values: const ['min', 'max'],
                  onChange: onUpdateMainAxisSize)
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              LayoutAttributeSelector(
                  title: 'Cross Axis Align',
                  values: const [
                    'start',
                    'end',
                    'center',
                    'stretch',
                  ],
                  onChange: onUpdateCrossAxisAlignment),
              LayoutAttributeSelector(
                  title: 'Main Axis Align',
                  values: const [
                    'start',
                    'end',
                    'center',
                    'space between',
                    'space around',
                    'space evenly'
                  ],
                  onChange: onUpdateMainAxisAlignment)
            ],
          ),
        ),
      ],
    );
  }
}
