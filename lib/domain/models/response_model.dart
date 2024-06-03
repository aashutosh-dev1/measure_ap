import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:measure_ap/domain/models/answer_model.dart';
import 'package:measure_ap/domain/models/assessment_model.dart';

class ResponseModel {
  final AssessmentModel assessment;
  final List<AnswerModel> questions;

  ResponseModel({
    required this.assessment,
    required this.questions,
  });

  ResponseModel copyWith({
    AssessmentModel? assessment,
    List<AnswerModel>? questions,
  }) {
    return ResponseModel(
      assessment: assessment ?? this.assessment,
      questions: questions ?? this.questions,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'assessment': assessment.toMap()});
    result.addAll({'questions': questions.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      assessment: AssessmentModel.fromMap(map['assessment']),
      questions: List<AnswerModel>.from(
          map['questions']?.map((x) => AnswerModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ResponseModel(assessment: $assessment, questions: $questions)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseModel &&
        other.assessment == assessment &&
        listEquals(other.questions, questions);
  }

  @override
  int get hashCode => assessment.hashCode ^ questions.hashCode;
}
