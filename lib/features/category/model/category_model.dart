class CategoryModel {
  String? userId;
  int? sentenceId;
  String? sentence;
  String? author;

  CategoryModel({this.userId, this.sentenceId, this.sentence, this.author});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    sentenceId = json['sentenceId'];
    sentence = json['sentence'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['sentenceId'] = sentenceId;
    data['sentence'] = sentence;
    data['author'] = author;
    return data;
  }
}
