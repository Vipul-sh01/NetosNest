import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CalendarController extends GetxController {
  var selectedDay = DateTime.now().obs;

  void updateSelectedDay(DateTime day) {
    selectedDay.value = day;
  }

  void previousMonth() {
    selectedDay.value = DateTime(selectedDay.value.year, selectedDay.value.month - 1, 1);
  }

  void nextMonth() {
    selectedDay.value = DateTime(selectedDay.value.year, selectedDay.value.month + 1, 1);
  }

  String get monthName {
    return [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ][selectedDay.value.month - 1];
  }
}
