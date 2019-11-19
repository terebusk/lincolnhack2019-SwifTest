import 'package:flutter_app/models/result.dart';

class Subject {

  final int classId;
  List<Result> results;
  final String subjectName;
  final String teacherName;
  final String band;
  final int overallScore;

  Subject({this.subjectName, this.teacherName, this.classId, this.band, this.results, this.overallScore});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      classId: json['classId'] as int,
      subjectName: json['subjectName'],
      teacherName: json['teacherName'],
      band: json['band'],
      results: json['results'] != null ? Result.fromJsonList(json['results']) : null,
      overallScore: json['overallResult'] != null ? json['overallResult'] as int : null
    );
  }

  static List<Subject> fromJsonList(dynamic json) {
    if (json is List) {
      List list = json;
      return list.map((e) => Subject.fromJson(e)).toList();
    }
    return [Subject.fromJson(json)];
  }
}