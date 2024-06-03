// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:measure_ap/data/firebase_services.dart';
import 'package:measure_ap/presentation/home/home_screen.dart';
import 'package:measure_ap/presentation/resources/color_manager.dart';
import 'package:measure_ap/presentation/resources/custom_text_theme.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  static const List<Widget> _widgetItems = [
    HomeScreen(),
    Text('1'),
    Text('2'),
    Text('3'),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetItems.elementAt(_selectedIndex),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        onTap: (value) {
          FirebaseServices().fetchAssessmentsFromFirestore();
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
            label: 'Icon',
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
