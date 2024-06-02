import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:measure_ap/domain/question_model.dart';
import 'package:measure_ap/presentation/widgets/expanded_text.dart';

import '../../resources/color_manager.dart';
import '../../resources/custom_text_theme.dart';

class MultipleQuestionWidget extends StatefulWidget {
  final QuestionModel question;
  const MultipleQuestionWidget({
    super.key,
    required this.question,
  });

  @override
  State<MultipleQuestionWidget> createState() => _MultipleQuestionWidgetState();
}

class _MultipleQuestionWidgetState extends State<MultipleQuestionWidget> {
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
            question.question,
            style: customTextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
              ls: 0,
            ),
          ),
          const Gap(14.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ExpandableText(
              text: question.description,
            ),
          ),
          const Gap(32.0),
          Expanded(
            child: ListView.builder(
              itemCount: question.options.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (selectedIndex.contains(index)) {
                      removeIndex(index);
                    } else {
                      addIndex(index);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      padding: const EdgeInsets.all(24.0),
                      width: 335,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.0),
                        border: Border.all(
                          color: ColorManager.borderColor,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 26,
                            width: 26,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedIndex.contains(index)
                                  ? ColorManager.checkboxColor
                                  : null,
                              border: Border.all(
                                color: selectedIndex.contains(index)
                                    ? Colors.white
                                    : Colors.grey.shade400,
                              ),
                            ),
                            child: const Icon(
                              Icons.check,
                              size: 18.0,
                              color: Colors.white,
                            ),
                          ),
                          const Gap(12),
                          Text(
                            question.options[index],
                            style: customTextStyle(
                              fontWeight: FontWeight.w700,
                              ls: 0,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
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

  addIndex(int index) {
    selectedIndex.add(index);
    setState(() {});
  }

  removeIndex(int index) {
    selectedIndex.remove(index);
    setState(() {});
  }
}
