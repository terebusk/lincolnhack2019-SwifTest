class Student {
  final int userId;
  final String username;
  int result;
  String resultImage;

  Student({this.userId, this.username, this.result, this.resultImage});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      userId: int.parse(json['userId']),
      username: json['username'],
      result: int.parse(json['result']),
      resultImage: json['resultImage']
    );
  }

  static List<Student> fromJsonList(dynamic json) {
    if (json is List) {
      List list = json;
      return list.map((e) => Student.fromJson(e)).toList();
    }
    return [Student.fromJson(json)];
  }
}