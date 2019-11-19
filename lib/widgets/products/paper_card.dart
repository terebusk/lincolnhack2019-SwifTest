import 'package:flutter/material.dart';
import 'package:flutter_app/models/subject.dart';
import 'package:flutter_app/scoped-models/main.dart';
import 'package:flutter_app/widgets/products/price_tag.dart';
import 'package:flutter_app/widgets/ui_elements/title_default.dart';
import 'package:scoped_model/scoped_model.dart';

class PaperCard extends StatelessWidget {
  final Subject subject;
  final int paperIndex;

  PaperCard(this.subject, this.paperIndex);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    if (subject.results[paperIndex].resultImage != null) {
      list.add(Image.network(subject.results[paperIndex].resultImage, fit: BoxFit.fitWidth,));
    }
    list.addAll([
      _buildGradeRow(),
      //AddressTag('Union Square, San Francisco'),
      //Text(subject.userEmail),
      //_buildActionButtons(context)
    ]);

    return Card(
        child: Column(children: list));
  }

  Widget _buildGradeRow() {
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: TitleDefault(
                  subject.results[paperIndex].testTime), //TODO: should every exam have an actual name?
            ),
            SizedBox(
              width: 8.0,
            ),
            ResultTag(subject.results[paperIndex].result.toString())
          ],
        ));
  }

/*  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
      IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).accentColor,
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/product/' + paperIndex.toString())),
      ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
        return IconButton(
            icon: Icon(model.allProducts[paperIndex].isFavorite
                ? Icons.favorite
                : Icons.favorite_border),
            color: Colors.red,
            onPressed: () {
              model.selectSubject(paperIndex);
              model.toggleProductFavoriteStatus();
            });
      })
    ]);
  }*/
}
