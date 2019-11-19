import 'package:flutter_app/models/authentication.dart';
import 'package:flutter_app/models/class.dart';
import 'package:flutter_app/models/subject.dart';
import 'package:flutter_app/models/user_type.dart';

class User {
  final int userId;
  final Authentication authentication;
  final UserType type;
  final String username;
  final String schoolYear;
  final int classId;
  List<Subject> studentSubjects;
  List<Class> teacherClasses;

  User({this.schoolYear, this.authentication, this.type, this.username, this.userId, this.classId, this.teacherClasses, this.studentSubjects});

  factory User.fromJson(Map<String, dynamic> json) {
    print(UserType.teacher);
    return User(
      userId: json['userId'] as int,
      authentication: null,
      type: UserType.values.firstWhere((e) => e.toString() == 'UserType.' + json['type'].toString().toLowerCase()),
      username: json['username'],
      schoolYear: json['schoolYear'],
      //classId: int.parse(json['classId']),
      studentSubjects: json['studentSubjects'] != null ? Subject.fromJsonList(json['studentSubjects']) : null,
      teacherClasses: json['teacherClasses'] != null ? Class.fromJsonList(json['teacherClasses']) : null,
    );
  }
}