import 'package:flutter/material.dart';

class WeekdaysRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> weekdays = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 30,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: weekdays
              .map((day) => Text(
            day,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ))
              .toList(),
        ),
      ),
    );
  }
}
