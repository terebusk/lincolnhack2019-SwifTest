/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/product_edit.dart';
import 'package:flutter_app/scoped-models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductListPage extends StatelessWidget {
  Widget _buildEditButton(BuildContext context, int index, MainModel model) {
    return IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          model.selectProduct(index);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return ProductEditPage();
          })).then((_) {
            model.selectProduct(null);
          });
          ;
        });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.builder(
            itemCount: model.allProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  key: Key(model.allProducts[index].title),
                  onDismissed: (DismissDirection direction) {
                    model.selectProduct(index);
                    if (direction == DismissDirection.endToStart) {
                      model.deleteProduct();
                    }
                  },
                  background: Container(
                    color: Colors.red,
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Image.file(File(model.allProducts[index].path)),
                        ),
                        title: Text(model.allProducts[index].title),
                        subtitle: Text(
                            '\$${model.allProducts[index].grade.toString()}'),
                        trailing: _buildEditButton(context, index, model),
                      ),
                      Divider()
                    ],
                  ));
            });
      },
    );
  }
}
*/
