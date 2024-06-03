import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:measure_ap/domain/assessment_model.dart';
import 'package:measure_ap/presentation/assessment/assessment_cubit/assessment_cubit.dart';
import 'package:measure_ap/presentation/assessment/question_screen.dart';
import 'package:measure_ap/presentation/resources/color_manager.dart';
import 'package:measure_ap/presentation/resources/custom_text_theme.dart';
import 'package:measure_ap/presentation/widgets/build_questions_ui.dart';
import 'package:measure_ap/presentation/widgets/gradient_button.dart';

class CreateAssessment extends StatefulWidget {
  const CreateAssessment({super.key});

  @override
  State<CreateAssessment> createState() => _CreateAssessmentState();
}

class _CreateAssessmentState extends State<CreateAssessment> {
  String? _selectedCognitive, _selectedApplicableMeasure;
  final TextEditingController paitentNameController = TextEditingController();

  final List<String> _cognitiveStatus = [
    'Cognition',
    'Z00.00',
    'Z01.89',
  ];
  final List<String> _applicableMeasures = [
    'Slums',
    'Phyical Examination',
    'Diagonistic Tests'
  ];
  bool isApplicableMeasuresEnabled = false;
  bool isPaitentEnabled = false;
  @override
  void dispose() {
    paitentNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        child: GradientButton(
          label: 'Start assessment',
          onTap: (isApplicableMeasuresEnabled &&
                  isPaitentEnabled &&
                  paitentNameController.text.isNotEmpty)
              ? () {
                  context.read<AssessmentCubit>().setAssessmentData(
                        assessmentModel: AssessmentModel(
                          cognitiveStatus: _selectedCognitive!,
                          applicaableMeasures: _selectedApplicableMeasure!,
                          name: paitentNameController.text,
                        ),
                      );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizPage(),
                    ),
                  );
                }
              : () {},
          isEnabled: (isApplicableMeasuresEnabled &&
                  isPaitentEnabled &&
                  paitentNameController.text.isNotEmpty)
              ? true
              : false,
        ),
      ),
      appBar: AppBar(
        backgroundColor: ColorManager.grey,
        title: Text(
          "New assessment",
          style: customTextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 16.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cognitive status',
              style: customTextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
                color: ColorManager.lightGrey,
              ),
            ),
            const Gap(8.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
                  border: InputBorder.none,
                ),
                hint: Text('Select cognitive status',
                    style: customTextStyle(
                      fontSize: 16.0,
                      color: ColorManager.lightGrey,
                    )),
                value: _selectedCognitive,
                onChanged: (newValue) {
                  setState(() {
                    _selectedCognitive = newValue;
                    isApplicableMeasuresEnabled = true;
                  });
                },
                items: _cognitiveStatus.map((status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(
                      status,
                      style: customTextStyle(
                        fontSize: 14.0,
                        color: ColorManager.lightGrey,
                      ),
                    ),
                  );
                }).toList(),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ),
            ),
            const Gap(33.0),
            Text(
              'Applicable measures',
              style: customTextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
                color: ColorManager.lightGrey,
              ),
            ),
            const Gap(8.0),
            Container(
              decoration: BoxDecoration(
                color: isApplicableMeasuresEnabled
                    ? Colors.white
                    : ColorManager.grey,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
                  border: InputBorder.none,
                ),
                hint: Text('Select applicable measures',
                    style: customTextStyle(
                      fontSize: 16.0,
                      color: ColorManager.lightGrey,
                    )),
                value: _selectedApplicableMeasure,
                onChanged: isApplicableMeasuresEnabled
                    ? (newValue) {
                        setState(() {
                          _selectedApplicableMeasure = newValue;
                          isPaitentEnabled = true;
                        });
                      }
                    : null,
                items: _applicableMeasures.map((status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(
                      status,
                      style: customTextStyle(
                        fontSize: 14.0,
                        color: ColorManager.lightGrey,
                      ),
                    ),
                  );
                }).toList(),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ),
            ),
            const Gap(33.0),
            Text(
              'Paitent',
              style: customTextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
                color: ColorManager.lightGrey,
              ),
            ),
            const Gap(8.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: TextField(
                controller: paitentNameController,
                enabled: isPaitentEnabled ? true : false,
                onChanged: (value) => setState(() {
                  paitentNameController.text = value;
                }),
                decoration: InputDecoration(
                  hintText: 'Enter patient name or ID',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                  ),
                  fillColor:
                      isPaitentEnabled ? Colors.white : ColorManager.grey,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
