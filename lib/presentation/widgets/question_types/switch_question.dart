import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:measure_ap/domain/question_model.dart';

import '../../resources/color_manager.dart';
import '../../resources/custom_text_theme.dart';

class SwitchQuestionWidget extends StatefulWidget {
  final QuestionModel question;
  const SwitchQuestionWidget({
    super.key,
    required this.question,
  });

  @override
  State<SwitchQuestionWidget> createState() => _SwitchQuestionWidgetState();
}

class _SwitchQuestionWidgetState extends State<SwitchQuestionWidget> {
  String selectedAnimal = "";

  void toggleSwitch(String animal) {
    setState(() {
      selectedAnimal = selectedAnimal == animal ? "" : animal;
    });
  }

  QuestionModel get question => widget.question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                final animal = question.options[index];
                final isSelected = selectedAnimal == animal;
                return GestureDetector(
                  onTap: () => toggleSwitch(animal),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      child: Column(
                        children: [
                          animalSwitch(question.options[index], isSelected),
                          const Divider(),
                        ],
                      )),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget animalSwitch(String animal, bool isSelected) {
    bool isDisabled = selectedAnimal.isNotEmpty && !isSelected;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 67,
                width: 67,
                child: Image.asset('assets/images/chicken.png'),
              ),
              const SizedBox(width: 10),
              Text(
                animal,
                style: TextStyle(
                  fontSize: 18,
                  color: isDisabled ? Colors.grey : Colors.black,
                ),
              ),
            ],
          ),
          Transform.scale(
            scale: 1.0,
            child: CupertinoSwitch(
              value: isSelected,
              onChanged: isDisabled
                  ? null
                  : (value) {
                      toggleSwitch(animal);
                    },
              activeColor: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
