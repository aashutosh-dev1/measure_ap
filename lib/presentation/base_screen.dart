import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:measure_ap/presentation/home/home_screen.dart';

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
  ];
  final int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetItems.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Icon',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
