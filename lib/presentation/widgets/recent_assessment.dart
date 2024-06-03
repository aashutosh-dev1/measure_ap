// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:measure_ap/domain/models/response_model.dart';

import '../resources/color_manager.dart';
import '../resources/custom_text_theme.dart';

class RecentAssessmentWidget extends StatelessWidget {
  final ResponseModel history;
  const RecentAssessmentWidget({
    super.key,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x26000000), // Adjusted color with opacity
              offset: Offset(0, 21),
              blurRadius: 18.8,
              spreadRadius: -19,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 8, bottom: 8, left: 12.0),
                    width: 267.0,
                    decoration: BoxDecoration(
                      color: ColorManager.lightOrange.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x26000000),
                          offset: Offset(0, 21),
                          blurRadius: 18.8,
                          spreadRadius: -19,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          history.assessment.cognitiveStatus,
                          style: customTextStyle(
                            color: ColorManager.orange,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const Gap(8.0),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            color: ColorManager.orange,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Gap(8.0),
                        Text(
                          history.assessment.applicaableMeasures,
                          style: customTextStyle(
                            color: ColorManager.orange,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    'assets/svg/more.svg',
                    color: ColorManager.lightOrange,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
