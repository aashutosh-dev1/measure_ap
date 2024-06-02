import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:measure_ap/presentation/resources/color_manager.dart';
import 'package:measure_ap/presentation/resources/custom_text_theme.dart';

class CreateAssessment extends StatefulWidget {
  const CreateAssessment({super.key});

  @override
  State<CreateAssessment> createState() => _CreateAssessmentState();
}

class _CreateAssessmentState extends State<CreateAssessment> {
  String? _selectedCognitive, _selectedApplicableMeasure;

  final List<String> _cognitiveStatus = ['Cognition', 'Z00.00', 'Z01.89'];
  final List<String> _applicableMeasures = [
    'Slums',
    'Phyical Examination',
    'Diagonistic Tests'
  ];
  bool isApplicableMeasuresEnabled = false;
  bool isPaitentEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey,
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
                    isApplicableMeasuresEnabled = !isApplicableMeasuresEnabled;
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
                hint: Text('Select applicable measures',
                    style: customTextStyle(
                      fontSize: 16.0,
                      color: ColorManager.lightGrey,
                    )),
                value: _selectedApplicableMeasure,
                onChanged: (newValue) {
                  setState(() {
                    _selectedApplicableMeasure = newValue;
                  });
                },
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
                child: const Text("Paitent name")),
          ],
        ),
      ),
    );
  }
}
