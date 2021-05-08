import 'dart:convert';

import 'package:DevQuiz/shared/models/answers_model.dart';

class QuestionModel {
  final String title;
  final List<AnswerModel> anserws;

  QuestionModel({
    required this.title,
    required this.anserws,
  }) : assert(anserws.length == 4);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'anserws': anserws.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      anserws: List<AnswerModel>.from(
          map['anserws']?.map((x) => AnswerModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}
