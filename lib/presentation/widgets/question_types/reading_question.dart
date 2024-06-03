import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:measure_ap/domain/question_model.dart';
import 'package:measure_ap/presentation/assessment/assessment_cubit/assessment_cubit.dart';
import 'package:measure_ap/presentation/widgets/expanded_text.dart';

import '../../resources/color_manager.dart';
import '../../resources/custom_text_theme.dart';

class ReadingQuestionWidget extends StatefulWidget {
  final QuestionModel question;
  const ReadingQuestionWidget({
    super.key,
    required this.question,
  });

  @override
  State<ReadingQuestionWidget> createState() => _ReadingQuestionWidgetState();
}

class _ReadingQuestionWidgetState extends State<ReadingQuestionWidget> {
  QuestionModel get question => widget.question;
  List<int> selectedIndex = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          const Gap(50.0),
          Text(
            "Recall question:",
            style: customTextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              color: ColorManager.lightGrey,
              ls: 0,
            ),
          ),
          const Gap(14.0),
          Text(
            question.question,
            style: customTextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
              ls: 0,
            ),
          ),
          const Gap(25.0),
          Text(
            question.description,
            style: customTextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              color: ColorManager.lightGrey,
              ls: 0,
            ),
          ),
          const Gap(32.0),
        ],
      ),
    );
  }
}
