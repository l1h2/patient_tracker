import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/src/core/models/records_model.dart';

class SelectionCheckbox extends StatefulWidget {
  const SelectionCheckbox({
    super.key,
    required this.locale,
    required this.theme,
    required this.records,
  });

  final AppLocalizations locale;
  final ThemeData theme;
  final Records records;

  @override
  State<SelectionCheckbox> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<SelectionCheckbox> {
  late bool _isMale;

  @override
  void initState() {
    super.initState();
    _isMale = widget.records.intercurrences ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.locale.intercurrences,
                style: widget.theme.textTheme.titleMedium,
              ),
              const SizedBox(width: 10),
              CheckboxMenuButton(
                value: widget.records.intercurrences ?? false,
                child: Text(widget.locale.maleAbr),
                onChanged: (value) {
                  setState(() {
                    _isMale = value ?? false;
                    widget.records.intercurrences = _isMale;
                  });
                },
              ),
              CheckboxMenuButton(
                value: !(widget.records.intercurrences ?? false),
                child: Text(widget.locale.femaleAbr),
                onChanged: (value) {
                  setState(() {
                    _isMale = !(value ?? false);
                    widget.records.intercurrences = _isMale;
                  });
                },
              ),
            ],
          ),
          TextFormField(
            initialValue: widget.records.comments ?? '',
            decoration: InputDecoration(labelText: widget.locale.comments),
            maxLines: null,
            keyboardType: TextInputType.multiline,
            onChanged: (value) => widget.records.comments = value,
          )
        ],
      ),
    );
  }
}
