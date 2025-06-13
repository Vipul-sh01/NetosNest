// lib/Utility/course_enum.dart
import 'package:get/get.dart';

enum CourseName {
  Btech,
  mtech,
  bsc,
  msc,
  mba,
  fine,
}

extension CourseNameExtension on CourseName {
  String get label {
    switch (this) {
      case CourseName.Btech:
        return 'B.tech';
      case CourseName.mtech:
        return 'M.Tech';
      case CourseName.bsc:
        return 'B.Sc';
      case CourseName.msc:
        return 'M.Sc';
      case CourseName.mba:
        return 'MBA';
      case CourseName.fine:
        return 'Fine';
    }
  }

  static CourseName? fromLabel(String label) {
    return CourseName.values.firstWhereOrNull((e) => e.label == label);
  }
}
