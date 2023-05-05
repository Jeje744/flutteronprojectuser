import 'dart:async';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

List<dynamic> dataTanggal = [];
List<dynamic> dataPilihan = [];
hapusArrayNull() {
  for (var i = 0; i < dataTanggal.length; i++) {
    if (dataTanggal[i] == 'null') {
      dataTanggal.remove('null');
    }
  }
}

hapusDataArray() {
  dataTanggal = [];
  dataPilihan = [];
}

class _CalendarState extends State<Calendar> {
  Future<void> alertRadio() async {
    int? groupRadio;
    int i = 0;
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text('Pilihan '),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();

                    dataTanggal.add('${_focusDay.toString()}');
                    dataPilihan.add('${groupRadio}');
                    hapusArrayNull();
                    //hapusDataArray();
                    if (dataTanggal.length > 0) {
                      print('ada array');

                      for (var e in dataTanggal) {
                        if (e == _focusDay.toString()) {
                          i += 1;
                        }
                        print(e);
                      }

                      if (i > 1) {
                        var dT = dataTanggal.removeLast();
                        var dP = dataPilihan.removeLast();
                        print(dT);
                        print(dP);
                      }
                    } else {
                      print('tidak ada array');
                    }
                  },
                  child: Text('Ya')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    hapusDataArray();
                  },
                  child: Text('Tidak')),
            ],
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Column(
                children: List<Widget>.generate(10, (int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Pilihan Data ${index + 1}'),
                      Radio(
                        value: index + 1,
                        groupValue: groupRadio,
                        onChanged: (value) {
                          setState(() => groupRadio = value!);
                          //print(groupRadio);
                        },
                      ),
                    ],
                  );
                }),
              );
            }),
          );
        });
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .popAndPushNamed('/view/loginview/terimadata');
                    hapusDataArray();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 27,
                  )),
              Text(
                'Absence Personal',
                textAlign: TextAlign.center,
              ),
              Text(
                ' ',
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.lime,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TableCalendar(
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              focusedDay: _focusDay,
              firstDay: DateTime.utc(2010, 01, 01),
              lastDay: DateTime.utc(2030, 12, 31),
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusDay = focusedDay;
                  });
                  alertRadio();
                } else {
                  alertRadio();
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusDay = focusedDay;
              },
            ),
            GestureDetector(
              onTap: null,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.center,
                width: 290,
                height: 35,
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Colors.lime,
                    border: Border.all(width: 1, color: Colors.lime),
                    borderRadius: BorderRadius.circular(25)),
              ),
            )
          ],
        ));
  }
}
