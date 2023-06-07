import 'package:flutter/material.dart';

class LayoutAttributeSelector extends StatefulWidget {
  const LayoutAttributeSelector(
      {Key? key,
      required this.title,
      required this.values,
      this.disable = false,
      required this.onChange})
      : super(key: key);

  final String title;
  final List<String> values;
  final bool disable;
  final ValueChanged<int> onChange;

  @override
  State<LayoutAttributeSelector> createState() =>
      _LayoutAttributeSelectorState();
}

class _LayoutAttributeSelectorState extends State<LayoutAttributeSelector> {
  int valueIndex = 0;

  void onPrevious() {
    valueIndex = valueIndex <= 0 ? widget.values.length - 1 : valueIndex - 1;
    widget.onChange(valueIndex);
  }

  void onNext() {
    valueIndex = valueIndex >= widget.values.length - 1 ? 0 : valueIndex + 1;
    widget.onChange(valueIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.black,
        ),
        Text(widget.title),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              padding: const EdgeInsets.all(4),
              icon: const Icon(Icons.arrow_back),
              onPressed: widget.disable ? null : onPrevious,
            ),
            Text(
              widget.values[valueIndex],
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            IconButton(
              padding: const EdgeInsets.all(4),
              icon: const Icon(Icons.arrow_forward),
              onPressed: widget.disable ? null : onNext,
            )
          ],
        )
      ],
    );
  }
}
