import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:measure_ap/domain/models/response_model.dart';
import 'package:measure_ap/presentation/resources/color_manager.dart';
import 'package:measure_ap/presentation/resources/custom_text_theme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HistoryDetailScreen extends StatefulWidget {
  final ResponseModel history;
  const HistoryDetailScreen({super.key, required this.history});

  @override
  State<HistoryDetailScreen> createState() => _HistoryDetailScreenState();
}

class _HistoryDetailScreenState extends State<HistoryDetailScreen> {
  ResponseModel get history => widget.history;
  late int totalMarks;
  List<int> marks = [];

  @override
  void initState() {
    super.initState();
    for (var i in history.questions) {
      if (i.answer['isAnswerCorrect']) {
        marks.add(i.answer['totalMark']);
      }
    }
    totalMarks = marks.fold(0, (previous, current) => previous + current);
  }

  @override
  Widget build(BuildContext context) {
    double percent = totalMarks / 18;

    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F4F4),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text(
          "History details",
          style: customTextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 16.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'ICOD code',
                        style: customTextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.lightGrey,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Last updated 05.03.2023',
                        style: customTextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.lightGrey,
                        ),
                      ),
                    ],
                  ),
                  const Gap(12.0),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      color: ColorManager.lightOrange.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          history.assessment.applicaableMeasures,
                          style: customTextStyle(
                            fontWeight: FontWeight.w800,
                            color: ColorManager.orange,
                            fontSize: 20.0,
                          ),
                        ),
                        const Gap(8.0),
                        Text(
                          history.assessment.cognitiveStatus,
                          style: customTextStyle(
                            fontWeight: FontWeight.w500,
                            color: ColorManager.orange,
                            fontSize: 16.0,
                          ),
                        ),
                        const Gap(12.0),
                      ],
                    ),
                  ),
                  const Gap(24.0),
                ],
              ),
            ),
            const Gap(18.0),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assessment date',
                    style: customTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                      color: ColorManager.lightGrey,
                    ),
                  ),
                  const Gap(12.0),
                  Text(
                    '04.03.2024.',
                    style: customTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                    ),
                  ),
                  const Gap(12.0),
                ],
              ),
            ),
            const Gap(18.0),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    history.assessment.name,
                    style: customTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0,
                      color: ColorManager.dark,
                    ),
                  ),
                  const Gap(6.0),
                  Text(
                    '#26213082',
                    style: customTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                      color: ColorManager.lightGrey,
                    ),
                  ),
                  const Gap(12.0),
                ],
              ),
            ),
            const Gap(18.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 70.0,
                      lineWidth: 15.0,
                      percent: percent,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$totalMarks',
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            '/18',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      progressColor: const Color(0xff44D1BB),
                    ),
                    const Gap(16.0),
                    const Divider(),
                    const Gap(16.0),
                    ListView.builder(
                      itemCount: history.questions.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        String status = history
                            .questions[index].answer['isAnswerCorrect']
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
            ),
            const Gap(28.0),
          ],
        ),
      ),
    );
  }
}
