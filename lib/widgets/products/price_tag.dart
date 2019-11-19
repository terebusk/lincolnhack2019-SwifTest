import 'package:flutter/material.dart';

class ResultTag extends StatelessWidget {
  final String result;

  ResultTag(this.result);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 6.0),
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(5.0)),
        child: Text(
           result + '%',
          style: TextStyle(color: Colors.white),
        ));
  }
}
