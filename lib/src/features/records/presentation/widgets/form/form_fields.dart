import 'package:flutter/material.dart';

import '/src/core/utils/helpers.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ExpansionTile(
            title: Text(title),
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: child,
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

class Subsection extends StatelessWidget {
  const Subsection({
    super.key,
    required this.title,
    required this.theme,
    required this.child,
  });

  final String title;
  final ThemeData theme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(title, style: theme.textTheme.titleMedium),
          child,
          const Divider(),
        ],
      ),
    );
  }
}

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    super.key,
    required this.value,
    required this.title,
    required this.onChanged,
  });

  final bool? value;
  final String title;
  final ValueChanged<bool?> onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value ?? false;
  }

  void _handleChanged(bool? newValue) {
    setState(() {
      _value = newValue ?? false;
    });
    widget.onChanged(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxMenuButton(
      value: _value,
      onChanged: _handleChanged,
      child: Text(widget.title),
    );
  }
}

class NumberInput extends StatelessWidget {
  const NumberInput({
    super.key,
    required this.label,
    required this.unit,
    this.initialValue,
    required this.onChanged,
  });

  final String label;
  final String unit;
  final double? initialValue;
  final ValueChanged<double?> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextFormField(
        initialValue: getNumberString(initialValue),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          suffixText: unit,
        ),
        onChanged: (value) => onChanged(double.tryParse(value)),
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.label,
    this.initialValue = '',
    required this.onChanged,
  });

  final String label;
  final String? initialValue;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(labelText: label),
        onChanged: onChanged,
      ),
    );
  }
}
