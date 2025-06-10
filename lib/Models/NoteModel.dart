import 'package:cloud_firestore/cloud_firestore.dart';

import 'ModuleModels.dart';
import 'UserModels.dart';

class NoteModel {
  final String noteId;
  final String title;
  final String courseCode;
  final String courseName;
  final String educationLevel;
  final String boardOrUniversity;
  final String? subject;
  final List<ModuleModel> modules;
  final bool isForSale;
  final UserModel uploadedBy;
  final DateTime examDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  NoteModel({
    required this.noteId,
    required this.title,
    required this.courseCode,
    required this.courseName,
    required this.educationLevel,
    required this.boardOrUniversity,
    this.subject,
    required this.modules,
    required this.isForSale,
    required this.uploadedBy,
    required this.examDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      noteId: json['noteId'],
      title: json['title'],
      courseCode: json['courseCode'],
      courseName: json['courseName'],
      educationLevel: json['educationLevel'],
      boardOrUniversity: json['boardOrUniversity'],
      subject: json['subject'],
      modules: (json['modules'] as List)
          .map((m) => ModuleModel.fromJson(m))
          .toList(),
      isForSale: json['isForSale'],
      uploadedBy: UserModel.fromJson(json['uploadedBy']),
      examDate: (json['examDate'] as Timestamp).toDate(),
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() => {
    'noteId': noteId,
    'title': title,
    'courseCode': courseCode,
    'courseName': courseName,
    'educationLevel': educationLevel,
    'boardOrUniversity': boardOrUniversity,
    'subject': subject,
    'modules': modules.map((m) => m.toJson()).toList(),
    'isForSale': isForSale,
    'uploadedBy': uploadedBy.toJson(),
    'examDate': examDate,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
