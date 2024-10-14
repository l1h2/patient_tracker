import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void deleteDocumentDialog({
  required BuildContext context,
  required VoidCallback onDelete,
  required String docName,
}) {
  final AppLocalizations locale = AppLocalizations.of(context)!;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(locale.deleteField(docName)),
        content: Text(
          locale.deletionConfirmation(docName.toLowerCase()),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 46,
                width: 120,
                child: FilledButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(locale.cancel),
                ),
              ),
              SizedBox(
                height: 46,
                width: 120,
                child: OutlinedButton(
                  onPressed: () {
                    onDelete();
                    Navigator.of(context).pop();
                  },
                  child: Text(locale.delete),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
