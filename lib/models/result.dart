class Result {

  final int resultId;
  final int result;
  final String resultImage;
  final String testTime;

  Result({this.resultId, this.result, this.resultImage, this.testTime});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      resultId: json['resultId'] as int,
      result: json['result'] != null ? json['result'] as int : null,
      resultImage: json['imageResult'],
      testTime: json['testTime']
    );
  }

  static List<Result> fromJsonList(dynamic json) {
    if (json is List) {
      List list = json;
      return list.map((e) => Result.fromJson(e)).toList();
    }
    return [Result.fromJson(json)];
  }
}