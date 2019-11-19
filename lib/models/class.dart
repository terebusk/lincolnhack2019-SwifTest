import 'package:flutter_app/models/student.dart';

class Class {
  final int classId;
  final String className;
  final String band;
  int classResult;
  List<Student> students;

  Class({this.classId, this.className, this.band, this.classResult, this.students});

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      classId: int.parse(json['classId']),
      className: json['className'],
      band: json['band'],
      classResult: int.parse(json['classResult']),
      students: json['students'] != null ? Student.fromJsonList(json['students']) : null
    );
  }

  static List<Class> fromJsonList(dynamic json) {
    if (json is List) {
      List list = json;
      return list.map((e) => Class.fromJson(e)).toList();
    }
    return [Class.fromJson(json)];
  }

}