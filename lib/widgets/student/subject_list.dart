import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/subject.dart';
import 'package:flutter_app/scoped-models/main.dart';
import 'package:flutter_app/widgets/student/subject_card.dart';
import 'package:scoped_model/scoped_model.dart';

class SubjectList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildSubjectList(model.allSubjects, model);
      },
    );
  }

  Widget _buildSubjectList(List<Subject> subjects, MainModel model) {
    Widget subjectCard =
    Center(child: Text(model.authenticatedUser.username));
    if (subjects.length > 0) {
      subjectCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            SubjectCard(subject: subjects[index], index: index, model :model),
        itemCount: subjects.length,
      );
    }
    return subjectCard;
  }
}