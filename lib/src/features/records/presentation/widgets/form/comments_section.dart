import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/src/core/models/records_model.dart';

class CommentsSection extends StatefulWidget {
  const CommentsSection({super.key, required this.records});

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
    widget.records.intercurrences = _intercurrences;
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                locale.intercurrences,
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(width: 10),
              CheckboxMenuButton(
                value: widget.records.intercurrences ?? false,
                child: Text(locale.yesAbr),
                onChanged: (value) {
                  setState(() {
                    _intercurrences = value ?? false;
                    widget.records.intercurrences = _intercurrences;
                  });
                },
              ),
              CheckboxMenuButton(
                value: !(widget.records.intercurrences ?? false),
                child: Text(locale.noAbr),
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
            decoration: InputDecoration(labelText: locale.comments),
            maxLines: null,
            keyboardType: TextInputType.multiline,
            onChanged: (value) => widget.records.comments = value,
          )
        ],
      ),
    );
  }
}
