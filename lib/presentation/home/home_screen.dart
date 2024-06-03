// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:measure_ap/presentation/assessment/create_assessment_screen.dart';
import 'package:measure_ap/presentation/assessment/question_screen.dart';
import 'package:measure_ap/presentation/resources/color_manager.dart';
import 'package:measure_ap/presentation/resources/custom_text_theme.dart';
import 'package:measure_ap/presentation/widgets/gradient_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(25.0),
              Row(
                children: [
                  Image.asset(
                    'assets/images/avatar_1.png',
                    height: 42.0,
                    width: 42.0,
                  ),
                  const Gap(12.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: customTextStyle(
                          color: ColorManager.lightGrey,
                        ),
                      ),
                      Text(
                        'Dr. Johnson',
                        style: customTextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.dark,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Monday',
                        style: customTextStyle(
                          color: ColorManager.lightGrey,
                        ),
                      ),
                      Text(
                        '16 April, 2024',
                        style: customTextStyle(
                          fontSize: 16.0,
                          color: ColorManager.dark,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(38.0),
              Row(
                children: [
                  Text(
                    'Recent history',
                    style: customTextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.dark,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'See more',
                    style: customTextStyle(
                      fontWeight: FontWeight.w700,
                      color: ColorManager.lightGrey,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 18,
                    color: ColorManager.lightGrey,
                  )
                ],
              ),
              const Gap(12.0),
              Column(
                children: List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(
                                      0x26000000), // Adjusted color with opacity
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
                                        padding: const EdgeInsets.only(
                                            top: 8, bottom: 8, left: 12.0),
                                        width: 267.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff4D6FE7)
                                              .withOpacity(0.12),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'data',
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
                                    "Name here",
                                    style: customTextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                        )).toList(),
              ),
              const Gap(38.0),
              Row(
                children: [
                  Text(
                    'Recent history',
                    style: customTextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.dark,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'See more',
                    style: customTextStyle(
                      fontWeight: FontWeight.w700,
                      color: ColorManager.lightGrey,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 18,
                    color: ColorManager.lightGrey,
                  )
                ],
              ),
              const Gap(12.0),
              Column(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(
                                0x26000000), // Adjusted color with opacity
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
                                  padding: const EdgeInsets.only(
                                      top: 8, bottom: 8, left: 12.0),
                                  width: 267.0,
                                  decoration: BoxDecoration(
                                    color: ColorManager.lightOrange
                                        .withOpacity(0.12),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'data',
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
                                        'Physical Examination',
                                        style: customTextStyle(
                                          color: ColorManager.orange,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
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
                  ),
                ),
              ),
              const Gap(43.0),
              GradientButton(
                label: "+ New assessment",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAssessment(),
                      ));
                },
              ),
              const Gap(15.0),
            ],
          ),
        ),
      ),
    );
  }
}
