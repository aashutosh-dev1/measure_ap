// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:measure_ap/presentation/assessment/create_assessment_screen.dart';
import 'package:measure_ap/presentation/base_screen.dart';
import 'package:measure_ap/presentation/home/home_cubit/home_cubit.dart';
import 'package:measure_ap/presentation/resources/color_manager.dart';
import 'package:measure_ap/presentation/resources/custom_text_theme.dart';
import 'package:measure_ap/presentation/widgets/gradient_button.dart';
import 'package:measure_ap/presentation/widgets/recent_history.dart';

import '../assessment/assessment_cubit/assessment_cubit.dart';
import '../widgets/recent_assessment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.stateStatus == StateStatus.loading ||
            state.stateStatus == StateStatus.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.stateStatus == StateStatus.error) {
          return Center(
            child: Text(state.toString()),
          );
        } else {
          return SizedBox(
            width: double.maxFinite,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListView(
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
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const BaseScreen(
                                index: 2,
                              ),
                              transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) =>
                                  child,
                            ),
                            (route) => false);
                      },
                      child: Row(
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
                    ),
                    const Gap(12.0),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final result = state.results[index];
                        return RecentHistoryWidget(
                          results: result,
                        );
                      },
                      itemCount:
                          state.results.length >= 3 ? 3 : state.results.length,
                    ),
                    const Gap(38.0),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const BaseScreen(
                                index: 2,
                              ),
                              transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) =>
                                  child,
                            ),
                            (route) => false);
                      },
                      child: Row(
                        children: [
                          Text(
                            'Recent assessments',
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
                    ),
                    const Gap(12.0),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          state.results.length >= 3 ? 3 : state.results.length,
                      itemBuilder: (context, index) {
                        final assessment = state.results[index];
                        return RecentAssessmentWidget(
                          history: assessment,
                        );
                      },
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
      },
    );
  }
}
