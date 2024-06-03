import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuestionModel {
  final String question;
  final String description;
  final List<String> options;
  final List<String> correctAnswers;
  final String questionType;
  final int totalMarks;

  QuestionModel({
    required this.question,
    required this.description,
    required this.options,
    required this.correctAnswers,
    required this.questionType,
    required this.totalMarks,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'question': question});
    result.addAll({'description': description});
    result.addAll({'options': options});
    result.addAll({'correctAnswers': correctAnswers});
    result.addAll({'questionType': questionType});
    result.addAll({'totalMarks': totalMarks});

    return result;
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      question: map['question'] ?? '',
      description: map['description'] ?? '',
      options: List<String>.from(map['options'])??[],
      correctAnswers: List<String>.from(map['correctAnswers']),
      questionType: map['questionType'] ?? '',
      totalMarks: map['totalMarks']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));

  QuestionModel copyWith({
    String? question,
    String? description,
    List<String>? options,
    List<String>? correctAnswers,
    String? questionType,
    int? totalMarks,
  }) {
    return QuestionModel(
      question: question ?? this.question,
      description: description ?? this.description,
      options: options ?? this.options,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      questionType: questionType ?? this.questionType,
      totalMarks: totalMarks ?? this.totalMarks,
    );
  }

  @override
  String toString() {
    return 'QuestionModel(question: $question, description: $description, options: $options, correctAnswers: $correctAnswers, questionType: $questionType, totalMarks: $totalMarks)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionModel &&
        other.question == question &&
        other.description == description &&
        listEquals(other.options, options) &&
        listEquals(other.correctAnswers, correctAnswers) &&
        other.questionType == questionType &&
        other.totalMarks == totalMarks;
  }

  @override
  int get hashCode {
    return question.hashCode ^
        description.hashCode ^
        options.hashCode ^
        correctAnswers.hashCode ^
        questionType.hashCode ^
        totalMarks.hashCode;
  }
}

List<QuestionModel> dummyQuestions = [
  QuestionModel(
    question: 'How many fingers do you see?',
    description:
        'Please show the patient a certain amount of fingers and follow their reaction.',
    options: [
      "Correct",
      "Incorrect",
    ],
    correctAnswers: ["Correct"],
    questionType: "single",
    totalMarks: 4,
  ),
  QuestionModel(
    question: 'Story ”Jill went to the shop”',
    description:
        'Full Description: "Jill went to the shop to buy candies. Afterwards instead of walking home, she took a cab. When she arrived home, she found her cat waiting at the door. She fed her cat and then sat down to enjoy her candies while watching her favorite TV show. Later, she called her friend to share the news about her day."',
    options: [
      "Jill bought candies.",
      "Jill has a dog as a pet.",
      "Jill took a cab."
    ],
    correctAnswers: ["Jill bought candies.", "Jill took a cab."],
    questionType: "multiple",
    totalMarks: 6,
  ),
  QuestionModel(
    question: 'Read the sentences',
    description:
        '''Proin ultrices fringilla et scelerisque sed duis massa nulla. Eget arcu urna ipsum in neque ornare. Integer placerat rhoncus purus est ut ultrices. Pharetra amet faucibus tincidunt mattis in enim. Duis pharetra integer adipiscing quisque elementum lacus porta. Sit diam aliquam quisque purus tortor.

Ut turpis consectetur massa libero. Habitant lobortis dictum pretium et tortor facilisi in enim porttitor. Purus porta pulvinar sit ultrices aliquam ultrices lacus quam. Gravida etiam facilisis enim purus ornare quis donec leo dignissim. Etiam at non aliquam quis. 

Pellentesque pellentesque at amet vitae turpis hac in. Felis eu purus vel interdum accumsan lorem dictu.''',
    options: [],
    correctAnswers: [],
    questionType: "reading",
    totalMarks: 2,
  ),
  QuestionModel(
    question: 'Identify the animals',
    description:
        'Please show the patient the following animals and check their response.',
    options: [
      "Chicken",
      "Horse",
      "Dog",
    ],
    correctAnswers: ["Chicken"],
    questionType: "switch",
    totalMarks: 6,
  ),
];
