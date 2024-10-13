import 'package:flutter/material.dart';

class BoolController {
  BoolController({this.boolean = false});

  bool boolean;
}

class SelectionCheckbox extends StatefulWidget {
  const SelectionCheckbox({
    super.key,
    required this.trueText,
    required this.falseText,
    this.alignment = MainAxisAlignment.start,
    required this.controller,
  });

  final String trueText;
  final String falseText;
  final MainAxisAlignment alignment;
  final BoolController controller;

  @override
  State<SelectionCheckbox> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<SelectionCheckbox> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.controller.boolean;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.alignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        CheckboxMenuButton(
          value: _value,
          child: Text(widget.trueText),
          onChanged: (value) => setState(() {
            _value = value ?? false;
            widget.controller.boolean = _value;
          }),
        ),
        CheckboxMenuButton(
          value: !_value,
          child: Text(widget.falseText),
          onChanged: (value) => setState(() {
            _value = !(value ?? false);
            widget.controller.boolean = _value;
          }),
        ),
      ],
    );
  }
}
