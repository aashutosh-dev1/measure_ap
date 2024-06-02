import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AssessmentResults extends StatelessWidget {
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
  Widget build(BuildContext context) {
    double percent = correctAnswers / totalQuestions;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircularPercentIndicator(
            radius: 100.0,
            lineWidth: 10.0,
            percent: percent,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$correctAnswers',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '/$totalQuestions',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            progressColor: Colors.green,
          ),
          const SizedBox(height: 20),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: questionsStatus.length,
              itemBuilder: (context, index) {
                String status = questionsStatus[index];
                Color statusColor =
                    status == 'Correct' ? Colors.green : Colors.red;

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
                        style: TextStyle(fontSize: 16, color: statusColor),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle "Show all" action
            },
            child: const Text(
              'Show all',
              style: TextStyle(
                fontSize: 16,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
