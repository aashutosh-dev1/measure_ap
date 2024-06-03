
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:measure_ap/presentation/assessment/assessment_cubit/assessment_cubit.dart';
import 'package:measure_ap/presentation/base_screen.dart';
import 'package:measure_ap/presentation/widgets/gradient_button.dart';
import 'package:measure_ap/presentation/widgets/question_types/result.dart';

import '../../domain/models/question_model.dart';
import '../widgets/build_questions_ui.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    if (page == 2) {
      final question3 = {
        'questionType': 'reading',
        'answer': {
          "isAnswerCorrect": true,
          "selectedAnswer": [],
          "totalMark": 2
        }
      };
      context.read<AssessmentCubit>().addQuestion(question3);
    }
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Assessment",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            if (_currentPage > 0) {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                dummyQuestions.length + 1,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: 50.0,
                  height: 6.0,
                  decoration: BoxDecoration(
                    color:
                        _currentPage == index ? Colors.black : Colors.grey[300],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: dummyQuestions.length + 1,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                if (index == 4) {
                  return const AssessmentResults(
                    correctAnswers: 12,
                    totalQuestions: 18,
                    questionsStatus: [
                      'Correct',
                      'Correct',
                      'Incorrect',
                      'Correct',
                    ],
                  );
                }
                return BuildQuestionsUI(question: dummyQuestions[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  GestureDetector(
                    onTap: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      width: 80,
                      height: 56,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade400,
                        ),
                        borderRadius: BorderRadius.circular(70),
                      ),
                      child: const Center(child: Icon(Icons.arrow_back_ios)),
                    ),
                  ),
                const Gap(10.0),
                Expanded(
                  child: GradientButton(
                    label: (_currentPage == dummyQuestions.length + 1 - 2)
                        ? "Finish"
                        : (_currentPage == dummyQuestions.length + 1 - 1)
                            ? "Print"
                            : "Continue",
                    onTap: () {
                      if (_currentPage == 3) {
                        context.read<AssessmentCubit>().sendDataTofireStore();
                      }
                      if (_currentPage == dummyQuestions.length + 1 - 1) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BaseScreen()),
                          (route) => false,
                        );
                      }
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButton(String text, VoidCallback onPressed,
      {required Gradient gradient}) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
