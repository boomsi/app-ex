import 'package:flutter/material.dart';
import 'package:app/widgets/layout_arrtibute_selector.dart';

class StackMenuControl extends StatelessWidget {
  const StackMenuControl(
      {Key? key,
      required this.useAlignment,
      required this.alignDirectional,
      required this.onAlignmentChange,
      required this.onAlignmentDirectionalChange})
      : super(key: key);

  final bool useAlignment;
  final Alignment alignDirectional;
  final ValueChanged<int> onAlignmentChange;
  final ValueChanged<int> onAlignmentDirectionalChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: LayoutAttributeSelector(
              title: 'Type',
              values: const ['position', 'align'],
              onChange: onAlignmentChange),
        ),
        Expanded(
            child: LayoutAttributeSelector(
                title: 'Alignment',
                disable: !useAlignment,
                values: const [
                  'top\nstart',
                  'top\ncenter',
                  'top\nend',
                  'center\nstart',
                  'center\ncenter',
                  'center\nend',
                  'bottom\nstart',
                  'bottom\ncenter',
                  'bottom\nend',
                ],
                onChange: onAlignmentDirectionalChange))
      ],
    );
  }
}
