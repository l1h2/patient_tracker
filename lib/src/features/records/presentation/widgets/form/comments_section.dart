import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/src/core/models/records_model.dart';

class CommentsSection extends StatefulWidget {
  const CommentsSection({
    super.key,
    required this.locale,
    required this.theme,
    required this.records,
  });

  final AppLocalizations locale;
  final ThemeData theme;
  final Records records;

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  late bool _intercurrences;

  @override
  void initState() {
    super.initState();
    _intercurrences = widget.records.intercurrences ?? false;
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
                child: Text(widget.locale.yesAbr),
                onChanged: (value) {
                  setState(() {
                    _intercurrences = value ?? false;
                    widget.records.intercurrences = _intercurrences;
                  });
                },
              ),
              CheckboxMenuButton(
                value: !(widget.records.intercurrences ?? false),
                child: Text(widget.locale.noAbr),
                onChanged: (value) {
                  setState(() {
                    _intercurrences = !(value ?? false);
                    widget.records.intercurrences = _intercurrences;
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
