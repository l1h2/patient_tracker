import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:table_calendar/table_calendar.dart';

import '../bloc/records_bloc.dart';

import '/src/core/widgets/error_widgets.dart';

class DatePicker extends StatelessWidget {
  DatePicker({
    super.key,
    required this.recordsBloc,
  }) : dateController = TextEditingController(
          text: recordsBloc.currentRecords.date.toString().split(' ')[0],
        );

  final RecordsBloc recordsBloc;
  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: dateController,
        readOnly: true,
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.calendar_today),
        ),
        textAlign: TextAlign.center,
        style: theme.textTheme.headlineSmall,
        onTap: () async => dateController.text = await showDialog<String>(
              context: context,
              builder: (context) {
                return Dialog(
                  child: CustomCalendar(
                    initialDate: DateTime.parse(dateController.text),
                    recordsBloc: recordsBloc,
                  ),
                );
              },
            ) ??
            dateController.text,
      ),
    );
  }
}

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    super.key,
    required this.initialDate,
    required this.recordsBloc,
  });

  final DateTime initialDate;
  final RecordsBloc recordsBloc;

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
    _focusedDay = ValueNotifier(widget.initialDate);
    _selectedDay = widget.initialDate;
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
    final AppLocalizations locale = AppLocalizations.of(context)!;

    return BlocConsumer<RecordsBloc, RecordsState>(
      listener: (context, state) {
        if (state is GetRecordsSuccess) {
          Navigator.pop(context);
          Navigator.pop(context, _selectedDay.toString().split(' ')[0]);
        } else if (state is GetRecordsFailure) {
          Navigator.pop(context);
          ErrorScaffoldMessenger.of(context).showSnackBar(
            locale.getRecordsError,
            Theme.of(context),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TableCalendar(
                  firstDay: firstDate,
                  lastDay: lastDate,
                  focusedDay: _focusedDay.value,
                  availableGestures: AvailableGestures.horizontalSwipe,
                  selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month'
                  },
                  calendarFormat: CalendarFormat.month,
                  headerStyle: const HeaderStyle(titleCentered: true),
                  calendarStyle: const CalendarStyle(
                    holidayDecoration: BoxDecoration(shape: BoxShape.circle),
                  ),
                  pageJumpingEnabled: true,
                  onHeaderTapped: (focusedDay) => _selectYear(context),
                  onHeaderLongPressed: (focusedDay) => _selectYear(context),
                  holidayPredicate: (day) =>
                      widget.recordsBloc.patient!.recordDates.any(
                    (recordDate) => isSameDay(day, recordDate),
                  ),
                  onDaySelected: _selectDay,
                  onDayLongPressed: _selectDay,
                  onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _selectDay(DateTime selectedDay, DateTime focusedDay) async {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay.value = focusedDay;
    });
    widget.recordsBloc.add(GetRecords(date: _selectedDay));

    await showDialog(
      context: context,
      builder: (context) {
        return const Scaffold(
          backgroundColor: Colors.transparent,
          body: ModalProgressHUD(
            inAsyncCall: true,
            child: SizedBox(),
          ),
        );
      },
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
