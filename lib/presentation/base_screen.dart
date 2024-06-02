import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  final int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetItems.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        onTap: (value) {
          
        },
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: customTextStyle(color: ColorManager.grey),
        unselectedLabelStyle: customTextStyle(color: ColorManager.grey),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/home.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/paitent.svg'),
            label: 'Icon',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/history.svg'),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/setting.svg'),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
