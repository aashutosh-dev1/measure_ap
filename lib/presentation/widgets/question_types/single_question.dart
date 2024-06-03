import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:measure_ap/presentation/assessment/assessment_cubit/assessment_cubit.dart';
import 'package:measure_ap/presentation/resources/color_manager.dart';
import 'package:measure_ap/presentation/resources/custom_text_theme.dart';

import '../../../domain/question_model.dart';

class SingleQuestionWidget extends StatefulWidget {
  final QuestionModel question;

  const SingleQuestionWidget({
    super.key,
    required this.question,
  });

  @override
  State<SingleQuestionWidget> createState() => _SingleQuestionWidgetState();
}

class _SingleQuestionWidgetState extends State<SingleQuestionWidget> {
  QuestionModel get question => widget.question;
  int? selectedOptions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          const Gap(50.0),
          Text(
            question.question,
            style: customTextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
              ls: 0,
            ),
          ),
          const Gap(14.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Text(
              question.description,
              textAlign: TextAlign.center,
              style: customTextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: ColorManager.lightGrey,
                ls: 0,
              ),
            ),
          ),
          const Gap(32.0),
          Expanded(
            child: ListView.builder(
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedOptions = index;
                    });
                    var isAnswerCorrect = question.options[index] ==
                        question.correctAnswers.first;
                    final question1 = {
                      'questionType': question.questionType,
                      'answer': {
                        "isAnswerCorrect": isAnswerCorrect,
                        "totalMark":question.totalMarks,
                        "selectedAnswer": question.options[selectedOptions!]
                      }
                    };
                    context.read<AssessmentCubit>().addQuestion(question1);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      padding: const EdgeInsets.all(24.0),
                      width: 335,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.0),
                        border: Border.all(
                          color: selectedOptions == index
                              ? ColorManager.orange
                              : ColorManager.borderColor,
                          width: selectedOptions == index ? 2 : 1,
                        ),
                      ),
                      child: Text(
                        question.options[index],
                        style: customTextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
