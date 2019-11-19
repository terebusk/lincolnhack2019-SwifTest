
// A widget that displays the picture taken by the user.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/submission.dart';
import 'package:flutter_app/scoped-models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;

  const DisplayPictureScreen({this.imagePath});

  @override
  State<StatefulWidget> createState() {
    return _DisplayPictureScreenState();
  }
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  double progress = 0.0;
  bool uploading = false;

  void updateProgress(double newProgress) {
    this.progress = newProgress;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> elements = [];


    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return Scaffold(
              appBar: AppBar(title: Text('Display the Picture')),

              // The image is stored as a file on the device. Use the `Image.file`
              // constructor with the given path to display the image.
              body: Center(
                child:
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Image.file(File(widget.imagePath)),

                      (() {
                        if (!uploading) {
                        return ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
                          FloatingActionButton(
                            child: Icon(Icons.clear),
                            heroTag: 'cancel',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          FloatingActionButton(
                            child: Icon(Icons.done),
                            heroTag: 'confirm',
                            onPressed: () {
                              uploading = true;
                              model
                                  .addPicture(Submission(
                                  title: 'title',
                                  description: 'description',
                                  grade: 0,
                                  userEmail: '',
                                  path: widget.imagePath), updateProgress)
                                  .then((value) {
                                Navigator.pushNamed(context, '/student/subjects');
                              });
                            },
                          ),
                        ]);
                      } else {
                          return Dialog(
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                new CircularProgressIndicator(),
                                new Text("Loading"),
                              ],
                            ),
                          );
                        }
                      }())

                    ],
                  ),
                ),
              ));
        });
  }
}
