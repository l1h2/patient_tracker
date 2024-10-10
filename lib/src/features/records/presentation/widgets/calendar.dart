import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:table_calendar/table_calendar.dart';

import '/src/core/models/records_model.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    required this.records,
  });

  final Map<String, Records> records;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(
      text: DateTime.now().toString().split(' ')[0],
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _dateController,
        readOnly: true,
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.calendar_today),
        ),
        textAlign: TextAlign.center,
        style: theme.textTheme.headlineSmall,
        onTap: () async => _dateController.text = await showDialog<String>(
              context: context,
              builder: (context) {
                return Dialog(
                  child: CustomCalendar(records: widget.records),
                );
              },
            ) ??
            _dateController.text,
      ),
    );
  }
}

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key, required this.records});

  final Map<String, Records> records;

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late final ValueNotifier<DateTime> _focusedDay;
  late DateTime _selectedDay;

  final firstDate = DateTime(2000);
  final lastDate = DateTime(2100);

  @override
  void initState() {
    super.initState();
    _focusedDay = ValueNotifier(DateTime.now());
    _selectedDay = DateTime.now();
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    super.dispose();
  }

  Future<void> _selectYear(BuildContext context) async {
    final int? selectedYear = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return YearPickerDialog(
          initialDate: _focusedDay.value,
          firstDate: firstDate,
          lastDate: lastDate,
        );
      },
    );

    if (selectedYear == null) return;

    final newDate = DateTime(
      selectedYear,
      _focusedDay.value.month,
      _focusedDay.value.day,
    );

    setState(() {
      _focusedDay.value = newDate;
      _selectedDay = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TableCalendar(
            firstDay: firstDate,
            lastDay: lastDate,
            focusedDay: _focusedDay.value,
            selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            availableCalendarFormats: const {CalendarFormat.month: 'Month'},
            calendarFormat: CalendarFormat.month,
            headerStyle: const HeaderStyle(titleCentered: true),
            calendarStyle: const CalendarStyle(
              holidayDecoration: BoxDecoration(shape: BoxShape.circle),
            ),
            pageJumpingEnabled: true,
            onHeaderTapped: (focusedDay) => _selectYear(context),
            onHeaderLongPressed: (focusedDay) => _selectYear(context),
            holidayPredicate: (day) => widget.records.values.any(
              (record) => isSameDay(day, record.date),
            ),
            onDaySelected: (selectedDay, focusedDay) => setState(() {
              _selectedDay = selectedDay;
              _focusedDay.value = focusedDay;
            }),
            onDayLongPressed: (selectedDay, focusedDay) => setState(() {
              _selectedDay = selectedDay;
              _focusedDay.value = focusedDay;
            }),
            onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
          ),
          TextButton(
            child: Text(AppLocalizations.of(context)!.select),
            onPressed: () => Navigator.pop(
              context,
              _selectedDay.toString().split(' ')[0],
            ),
          ),
        ],
      ),
    );
  }
}

class YearPickerDialog extends StatelessWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  const YearPickerDialog({
    super.key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.selectYear),
      content: SizedBox(
        width: double.minPositive,
        height: 300,
        child: YearPicker(
          selectedDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
          onChanged: (DateTime dateTime) {
            Navigator.pop(context, dateTime.year);
          },
        ),
      ),
    );
  }
}
