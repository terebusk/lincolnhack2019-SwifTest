import 'package:flutter/material.dart';
import 'package:flutter_app/models/subject.dart';
import 'package:flutter_app/scoped-models/main.dart';
import 'package:flutter_app/widgets/products/paper_list.dart';
import 'package:flutter_app/widgets/ui_elements/floating_menu.dart';
import 'package:scoped_model/scoped_model.dart';

class SubjectPage extends StatelessWidget {
  final int index;
  final Subject subject;

  SubjectPage({this.index, this.subject});

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(automaticallyImplyLeading: false, title: Text('Choose')),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text(subject.subjectName),
        actions: <Widget>[
          ScopedModelDescendant<MainModel>(
              builder: (BuildContext context, Widget child, MainModel model) {
            return IconButton(
              icon: Icon(model.displayFavoritesOnly
                  ? Icons.favorite
                  : Icons.favorite_border),
              onPressed: () {
                model.toggleDisplayMode();
              },
            );
          })
        ],
      ),
      floatingActionButton: FloatingMenu(),
      body: PaperList(index: index, subject: subject,),
    );
  }
}
