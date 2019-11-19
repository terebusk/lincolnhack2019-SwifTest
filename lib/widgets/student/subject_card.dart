import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/subject.dart';
import 'package:flutter_app/pages/subject.dart';
import 'package:flutter_app/scoped-models/main.dart';
import 'package:flutter_app/widgets/products/price_tag.dart';
import 'package:flutter_app/widgets/ui_elements/title_default.dart';

class SubjectCard extends StatelessWidget {
  final Subject subject;
  final int index;
  final MainModel model;

  SubjectCard({this.subject, this.index, this.model});

  @override
  Widget build(BuildContext context) {
    String imageName = '';
    switch (subject.subjectName.toLowerCase()) {
      case 'english':
        imageName = 'assets/english.png';
        break;
      case 'math':
        imageName = 'assets/maths.png';
        break;
      case 'science':
        imageName = 'assets/science.png';
        break;
      case 'geography':
        imageName = 'assets/geography.png';
        break;
      case 'history':
        imageName = 'assets/history.png';
        break;
      default:
        imageName = 'assets/school.png';
        break;
    }

    return GestureDetector(
        onTap: () {
          model.selectSubject(index);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return SubjectPage(index: index, subject: subject);
          })).then((_) {});
        },
        child: Card(
          child: Column(children: <Widget>[
            Image.asset(imageName),
            _buildGradeRow(subject.subjectName, subject.overallScore), //TODO: get an average/overall result
            Text(subject.teacherName), //Icon(Icons.school)
          ]),
        ));
  }

  Widget _buildGradeRow(String subjectName, int subjectResult) {
    List<Widget> list = [
      Expanded(
        child: TitleDefault(
            subjectName), //TODO: should every exam have an actual name?
      ),
      SizedBox(
        width: 8.0,
      )
    ];

    if (subjectResult != null) {
      list.add(ResultTag(subjectResult.toString()));
    }
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list,
        ));
  }
}
