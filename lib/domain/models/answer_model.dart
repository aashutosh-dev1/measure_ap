class AnswerModel {
  String questionType;
  Map<String, dynamic> answer;

  AnswerModel({required this.questionType, required this.answer});

  factory AnswerModel.fromMap(Map<String, dynamic> data) {
    return AnswerModel(
      questionType: data['questionType'] as String,
      answer: Map<String, dynamic>.from(data['answer'] as Map),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'questionType': questionType,
      'answer': answer,
    };
  }
}
