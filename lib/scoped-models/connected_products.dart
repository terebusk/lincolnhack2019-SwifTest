import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_app/models/authentication.dart';
import 'package:flutter_app/models/submission.dart';
import 'package:flutter_app/models/subject.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/models/user_type.dart';
import 'package:scoped_model/scoped_model.dart';

mixin ConnectedProductsModel on Model {
  int _selectedSubjectIndex;
  User authenticatedUser;


/*  void addProduct(
      String title, String description, String image, double price) {
    final Submission newProduct = Submission(
        title: title,
        description: description,
        grade: price,
        userEmail: authenticatedUser.authentication.email);
    _products.add(newProduct);
    notifyListeners();
  }*/

  Future addPicture(Submission pictureSubmission, Function updateProgress) async {
    List<int> imageBytes = File(pictureSubmission.path).readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    Response response;
    Dio dio = Dio();

    FormData formData = FormData.fromMap({
      "user_id" : this.authenticatedUser.userId,
      "class_id" : this.authenticatedUser.studentSubjects[_selectedSubjectIndex].classId,
      "image" : base64Image
    });
    response = await dio.post("https://1eb48caf.ngrok.io/upload",
        data: formData,
        onSendProgress: (int sent, int total) {
          updateProgress(sent / total);
    });
    print(response.data);
    Map<String, dynamic> userMap = response.data;
    User user = User.fromJson(userMap);

    authenticatedUser = user;

    notifyListeners();
    return response;
  }
}

mixin ProductsModel on ConnectedProductsModel {
  bool _showFavorites = false;

  List<Subject> get allSubjects {
    return List.from(authenticatedUser.studentSubjects);
  }

  int get selectedSubjectIndex {
    return _selectedSubjectIndex;
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  void selectSubject(int index) {
    _selectedSubjectIndex = index;
    if (index != null) {
      notifyListeners();
    }
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}

mixin UserModel on ConnectedProductsModel {
  Future<UserType> login(String email, String password) async {
    Response response;
    Dio dio = Dio();

    response = await dio.post(
        "https://1eb48caf.ngrok.io/login",
        data: json.encode({"username": email, "password": password}),
        options: new Options(headers: {"Content-Type": "application/json"})
    );
    print(response.data);
    Map<String, dynamic> userMap = response.data;
    User user = User.fromJson(userMap);

    authenticatedUser = user;

    return UserType.student;
  }
}
