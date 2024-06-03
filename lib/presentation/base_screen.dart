// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:measure_ap/presentation/history/history_screen.dart';
import 'package:measure_ap/presentation/home/home_cubit/home_cubit.dart';
import 'package:measure_ap/presentation/home/home_screen.dart';
import 'package:measure_ap/presentation/resources/color_manager.dart';
import 'package:measure_ap/presentation/resources/custom_text_theme.dart';

class BaseScreen extends StatefulWidget {
  final int? index;
  const BaseScreen({super.key, this.index});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int? _selectedIndex;

  @override
  void initState() {
    fetchAssessmentsApi();
    setIndex();
    super.initState();
  }

  setIndex() {
    _selectedIndex = widget.index ?? 0;
  }

  fetchAssessmentsApi() {
    context.read<HomeCubit>().fetchAssessments();
  }

  static const List<Widget> _widgetItems = [
    HomeScreen(),
    SafeArea(child: Center(child: Text('Paitent Screen ... TODO'))),
    HistoryScreen(),
    SafeArea(child: Center(child: Text('Settings Screen ... TODO'))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetItems.elementAt(_selectedIndex ?? 0),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: customTextStyle(color: ColorManager.grey),
        unselectedLabelStyle: customTextStyle(color: ColorManager.grey),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/home.svg',
              color:
                  _selectedIndex == 0 ? ColorManager.orange : ColorManager.dark,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/paitent.svg',
              color:
                  _selectedIndex == 1 ? ColorManager.orange : ColorManager.dark,
            ),
            label: 'Paitent',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/history.svg',
              color:
                  _selectedIndex == 2 ? ColorManager.orange : ColorManager.dark,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/setting.svg',
              color:
                  _selectedIndex == 3 ? ColorManager.orange : ColorManager.dark,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
