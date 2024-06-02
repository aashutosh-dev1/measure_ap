import 'package:flutter/material.dart';
import 'package:measure_ap/domain/question_model.dart';
import 'package:measure_ap/presentation/widgets/question_types/multiple_question.dart';
import 'package:measure_ap/presentation/widgets/question_types/reading_question.dart';
import 'package:measure_ap/presentation/widgets/question_types/single_question.dart';
import 'package:measure_ap/presentation/widgets/question_types/switch_question.dart';

class BuildQuestionsUI extends StatefulWidget {
  final QuestionModel question;
  const BuildQuestionsUI({super.key, required this.question});

  @override
  State<BuildQuestionsUI> createState() => _BuildQuestionsUIState();
}

class _BuildQuestionsUIState extends State<BuildQuestionsUI> {
  QuestionModel get question => widget.question;
  @override
  Widget build(BuildContext context) {
    return switch (question.questionType) {
      "single" => SingleQuestionWidget(
          question: question,
        ),
      "multiple" => MultipleQuestionWidget(
          question: question,
        ),
      "reading" => ReadingQuestionWidget(
          question: question,
        ),
      "switch" => SwitchQuestionWidget(
          question: question,
        ),
      _ => const Text("Hi we will be back with this question again")
    };
  }
}
