import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:measure_ap/presentation/assessment/assessment_cubit/assessment_cubit.dart';
import 'package:measure_ap/presentation/history/history_detail_screen.dart';
import 'package:measure_ap/presentation/home/home_cubit/home_cubit.dart';
import 'package:measure_ap/presentation/resources/custom_text_theme.dart';
import 'package:measure_ap/presentation/widgets/recent_history.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.stateStatus == StateStatus.loading ||
            state.stateStatus == StateStatus.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          color: const Color(0xffF4F4F4),
          height: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "History",
                      style: customTextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(10.0),
                    Row(
                      children: [
                        Container(
                          width: 274.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(62.0),
                            color: Colors.grey.shade200,
                          ),
                          child: TextField(
                            onChanged: (value) => setState(() {}),
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              contentPadding:
                                  const EdgeInsets.only(top: 5.0, right: 20),
                              prefixIcon: const Icon(
                                Icons.search_rounded,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey[500],
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const Gap(6.0),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade200,
                          ),
                          width: 55,
                          height: 50,
                          child: const Icon(Icons.format_list_bulleted_sharp),
                        )
                      ],
                    ),
                    const Gap(28.0),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final result = state.results[index];
                        return RecentHistoryWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HistoryDetailScreen(history: result),
                              ),
                            );
                          },
                          results: result,
                        );
                      },
                      itemCount: state.results.length,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
