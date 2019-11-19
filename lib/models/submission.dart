import 'package:flutter/material.dart';

class Submission {
  final String title;
  final String description;
  final double grade;
  final bool isFavorite;
  final String userEmail;
  final int userId;
  final int classId;

  String path;

  Submission(
      {
        this.classId, @required this.title,
      @required this.description,
      @required this.grade,
      @required this.userEmail,
      @required this.userId,
      this.isFavorite = false, this.path});
}
