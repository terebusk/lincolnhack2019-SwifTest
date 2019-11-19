import 'package:flutter/material.dart';
import 'package:flutter_app/pages/auth.dart';
import 'package:flutter_app/pages/camera.dart';
import 'package:flutter_app/pages/product.dart';
import 'package:flutter_app/pages/subject.dart';
import 'package:flutter_app/pages/products_admin.dart';
import 'package:flutter_app/pages/student/subject_list.dart';
import 'package:flutter_app/scoped-models/main.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
        model: MainModel(),
        child: MaterialApp(
          routes: {
            '/': (BuildContext context) => AuthPage(),
            '/student/subjects': (BuildContext context) => SubjectListPage(),
            '/student/subject': (BuildContext context) => SubjectPage(),
            //'/admin': (BuildContext context) => ProductsAdminPage(),
            '/camera': (BuildContext context) => TakePictureScreen()
          },
/*          onGenerateRoute: (RouteSettings routeSettings) {
            final List<String> pathElements = routeSettings.name.split('/');
            if (pathElements[0] != '') {
              return null;
            }
            if (pathElements[1] == 'product') {
              final int index = int.parse(pathElements[2]);
              return MaterialPageRoute<bool>(
                  builder: (BuildContext context) =>
                      ProductPage(index));
            }
            return null;
          },*/
          onUnknownRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute(
                builder: (BuildContext context) => SubjectPage());
          },
          theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              accentColor: Colors.deepPurple,
              buttonColor: Colors.deepPurple,
              brightness: Brightness.light),
          //home: AuthPage()
        )
    );
  }
}
