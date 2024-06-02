import 'package:flutter/material.dart';
import 'package:measure_ap/presentation/resources/custom_text_theme.dart';
import 'package:measure_ap/presentation/widgets/question_types/result.dart';

import '../../domain/question_model.dart';
import '../widgets/build_questions_ui.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
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
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // if (_currentPage > 0)
                //   _buildNavigationButton(
                //     "Back",
                //     () {
                //       _pageController.previousPage(
                //         duration: const Duration(milliseconds: 300),
                //         curve: Curves.easeInOut,
                //       );
                //     },
                //     gradient: const LinearGradient(
                //       colors: [
                //         Color(0xFF0753EB),
                //         Color(0xFFDE0000),
                //         Color(0xFFF88A00)
                //       ],
                //     ),
                //   ),

                if (_currentPage < dummyQuestions.length + 1 - 1)
                  _buildNavigationButton(
                    "Continue",
                    () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF0753EB),
                        Color(0xFFDE0000),
                        Color(0xFFF88A00)
                      ],
                    ),
                  ),
                // if (_currentPage == _quizPages.length - 1)

                //   _buildNavigationButton(
                //     "Finish",
                //     () {},
                //     gradient: const LinearGradient(
                //       colors: [
                //         Color(0xFF0753EB),
                //         Color(0xFFDE0000),
                //         Color(0xFFF88A00)
                //       ],
                //     ),
                //   ),
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

// class QuizStep extends StatelessWidget {
//   final String question;
//   final String discription;
//   final List<String> options;

//   const QuizStep({super.key, required this.question, required this.options, required this.discription});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(question,
//               textAlign: TextAlign.center,
//               style: customTextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.w700,
//               )),
//           const SizedBox(height: 20.0),
//           ...options.map((option) {
//             return ListTile(
//               title: Text(option),
//               leading: Radio(
//                 value: option,
//                 groupValue: null,
//                 onChanged: (value) {},
//               ),
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }
