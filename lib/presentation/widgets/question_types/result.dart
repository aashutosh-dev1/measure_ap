import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:measure_ap/presentation/assessment/assessment_cubit/assessment_cubit.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../resources/color_manager.dart';
import '../../resources/custom_text_theme.dart';

class AssessmentResults extends StatefulWidget {
  final int correctAnswers;
  final int totalQuestions;
  final List<String> questionsStatus;

  const AssessmentResults({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.questionsStatus,
  });

  @override
  State<AssessmentResults> createState() => _AssessmentResultsState();
}

class _AssessmentResultsState extends State<AssessmentResults> {
  int totalMarksObtained = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  int sumItems() {
    int t = 0;
    setState(() {
      if (context.watch<AssessmentCubit>().state.results != null) {
        t = context
            .watch<AssessmentCubit>()
            .state
            .results!
            .fold(0, (previous, current) => previous + current);
      }
    });
    return t;
  }

  @override
  Widget build(BuildContext context) {
    double percent = widget.correctAnswers / widget.totalQuestions;
    totalMarksObtained = sumItems();
    return BlocBuilder<AssessmentCubit, AssessmentState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Gap(32.0),
              Text(
                "Confirm the results",
                style: customTextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0,
                  ls: 0,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: ColorManager.borderColor,
                  ),
                ),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    (state.results == null)
                        ? const CircularProgressIndicator()
                        : CircularPercentIndicator(
                            radius: 70.0,
                            lineWidth: 15.0,
                            percent: percent,
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '$totalMarksObtained',
                                  style: const TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '/${widget.totalQuestions}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            progressColor: const Color(0xff44D1BB),
                          ),
                    const Gap(32.0),
                    const Divider(),
                    const Gap(16.0),
                    ListView.builder(
                      itemCount: state.selectedQuestions.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        String status = state.selectedQuestions[index]['answer']
                                ['isAnswerCorrect']
                            .toString();
                        Color statusColor =
                            status == 'true' ? Colors.green : Colors.red;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Question ${index + 1}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                status,
                                style:
                                    TextStyle(fontSize: 16, color: statusColor),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
