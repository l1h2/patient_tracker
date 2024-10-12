import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/src/core/models/records_model.dart';

class GeneralInformation extends StatefulWidget {
  const GeneralInformation({
    super.key,
    required this.locale,
    required this.theme,
    required this.records,
  });

  final AppLocalizations locale;
  final ThemeData theme;
  final Records records;

  @override
  State<GeneralInformation> createState() => _GeneralInformationState();
}

class _GeneralInformationState extends State<GeneralInformation> {
  late bool _isPhysiotherapy;

  @override
  void initState() {
    super.initState();
    _isPhysiotherapy = widget.records.isPhysiotherapy ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CheckboxMenuButton(
              value: !(widget.records.isPhysiotherapy ?? false),
              child: Text(widget.locale.pilates),
              onChanged: (value) {
                setState(() {
                  _isPhysiotherapy = !(value ?? false);
                  widget.records.isPhysiotherapy = _isPhysiotherapy;
                });
              },
            ),
            CheckboxMenuButton(
              value: widget.records.isPhysiotherapy ?? false,
              child: Text(widget.locale.physiotherapy),
              onChanged: (value) {
                setState(() {
                  _isPhysiotherapy = value ?? false;
                  widget.records.isPhysiotherapy = _isPhysiotherapy;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
