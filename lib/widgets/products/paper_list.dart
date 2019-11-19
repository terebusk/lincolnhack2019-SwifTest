import 'package:flutter/material.dart';
import 'package:flutter_app/models/subject.dart';
import 'package:flutter_app/scoped-models/main.dart';
import 'package:flutter_app/widgets/products/paper_card.dart';
import 'package:scoped_model/scoped_model.dart';

class PaperList extends StatelessWidget {

  final int index;
  final Subject subject;

  PaperList({this.index, this.subject});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildPaperList(model.authenticatedUser.studentSubjects[index], model);
      },
    );
  }

  Widget _buildPaperList(Subject subject, MainModel model) {
    Widget productCard =
        Center(child: Text(model.authenticatedUser.username));
    if (subject.results.length > 0) {
      productCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            PaperCard(subject, index),
        itemCount: subject.results.length,
      );
    }
    //return PaperCard(subject, index);
    return productCard;
  }
}
