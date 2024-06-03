import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:measure_ap/domain/response_model.dart';

import '../resources/color_manager.dart';
import '../resources/custom_text_theme.dart';

class RecentHistoryWidget extends StatelessWidget {
  final ResponseModel? results;
  final Function()? onTap;
  const RecentHistoryWidget({
    super.key,
    this.results,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x26000000),
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
                        color: const Color(0xff4D6FE7).withOpacity(0.12),
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x26000000),
                            offset: Offset(0, 21),
                            blurRadius: 10.8,
                            spreadRadius: -19,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            results?.assessment.cognitiveStatus ?? 'data',
                            style: customTextStyle(
                              color: ColorManager.blue,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Gap(8.0),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              color: ColorManager.blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const Gap(8.0),
                          Text(
                            results?.assessment.applicaableMeasures ??
                                'Physical Examination',
                            style: customTextStyle(
                              color: ColorManager.blue,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset('assets/svg/more.svg')
                  ],
                ),
                const Gap(28.0),
                Text(
                  results?.assessment.name ?? "Name here",
                  style: customTextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Male',
                          style: customTextStyle(
                            color: ColorManager.lightGrey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Gap(8.0),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            color: ColorManager.lightGrey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Gap(8.0),
                        Text(
                          '36 Years old',
                          style: customTextStyle(
                            color: ColorManager.lightGrey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Gap(8.0),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            color: ColorManager.lightGrey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Gap(8.0),
                        Text(
                          '36',
                          style: customTextStyle(
                            color: ColorManager.lightGrey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      '01.03.2024.',
                      style: customTextStyle(
                        color: ColorManager.lightGrey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
