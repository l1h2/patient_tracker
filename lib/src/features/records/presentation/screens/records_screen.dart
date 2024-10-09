import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:table_calendar/table_calendar.dart';

import '/src/core/models/company_model.dart';
import '/src/core/models/patient_model.dart';

@RoutePage()
class RecordsScreen extends StatefulWidget {
  const RecordsScreen({
    super.key,
    required this.company,
    required this.patient,
  });

  final Company company;
  final Patient patient;

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  late final ValueNotifier<DateTime> _focusedDay;
  late DateTime _selectedDay;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Records Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay.value,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay.value = focusedDay;
                });
              },
              calendarFormat: CalendarFormat.month,
              onFormatChanged: (format) {
                // Handle format change if needed
              },
              onPageChanged: (focusedDay) {
                _focusedDay.value = focusedDay;
              },
            ),
          ],
        ),
      ),
    );
  }
}
