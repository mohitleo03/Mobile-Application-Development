import 'package:flutter/material.dart';

class TabIconData {
  TabIconData(
      {this.imagePath = '',
      // this.index = 0,
      this.selectedImagePath = '',
      this.isSelected = false,
      this.animationController,
      this.tabName = ''});

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  // int index;
  AnimationController? animationController;
  String tabName;

  static Map<String, TabIconData> tabIconsList = {
    'Home': TabIconData(
      tabName: 'Home',
      imagePath: 'assets/images/tab_1.png',
      selectedImagePath: 'assets/images/tab_1s.png',
      // index: 0,
      isSelected: true,
      animationController: null,
    ),
    'Invoices': TabIconData(
      tabName: 'Invoices',
      imagePath: 'assets/images/tab_2.png',
      selectedImagePath: 'assets/images/tab_2s.png',
      // index: 1,
      isSelected: false,
      animationController: null,
    ),
    'Inventory': TabIconData(
      tabName: 'Inventory',
      imagePath: 'assets/images/tab_3.png',
      selectedImagePath: 'assets/images/tab_3s.png',
      // index: 2,
      isSelected: false,
      animationController: null,
    ),
    'Settings': TabIconData(
      tabName: 'Settings',
      imagePath: 'assets/images/tab_4.png',
      selectedImagePath: 'assets/images/tab_4s.png',
      // index: 3,
      isSelected: false,
      animationController: null,
    ),
    'Quotations': TabIconData(
      tabName: 'Quotations',
      imagePath: 'assets/images/tab_1.png',
      selectedImagePath: 'assets/images/tab_1s.png',
      // index: 0,
      isSelected: true,
      animationController: null,
    ),
    'Recurring Invoices': TabIconData(
      tabName: 'Recurring Invoices',
      imagePath: 'assets/images/tab_2.png',
      selectedImagePath: 'assets/images/tab_2s.png',
      // index: 1,
      isSelected: false,
      animationController: null,
    ),
    'Products': TabIconData(
      tabName: 'Products',
      imagePath: 'assets/images/tab_3.png',
      selectedImagePath: 'assets/images/tab_3s.png',
      // index: 2,
      isSelected: false,
      animationController: null,
    ),
    'Categories': TabIconData(
      tabName: 'Categories',
      imagePath: 'assets/images/tab_4.png',
      selectedImagePath: 'assets/images/tab_4s.png',
      // index: 3,
      isSelected: false,
      animationController: null,
    ),
    'Stores': TabIconData(
      tabName: 'Stores',
      imagePath: 'assets/images/tab_1.png',
      selectedImagePath: 'assets/images/tab_1s.png',
      // index: 0,
      isSelected: true,
      animationController: null,
    ),
    'Payments': TabIconData(
      tabName: 'Payments',
      imagePath: 'assets/images/tab_2.png',
      selectedImagePath: 'assets/images/tab_2s.png',
      // index: 1,
      isSelected: false,
      animationController: null,
    ),
    'Expenses': TabIconData(
      tabName: 'Expenses',
      imagePath: 'assets/images/tab_3.png',
      selectedImagePath: 'assets/images/tab_3s.png',
      // index: 2,
      isSelected: false,
      animationController: null,
    ),
    'Clients': TabIconData(
      tabName: 'Clients',
      imagePath: 'assets/images/tab_4.png',
      selectedImagePath: 'assets/images/tab_4s.png',
      // index: 3,
      isSelected: false,
      animationController: null,
    ),
    'ITC': TabIconData(
      tabName: 'ITC',
      imagePath: 'assets/images/tab_1.png',
      selectedImagePath: 'assets/images/tab_1s.png',
      // index: 0,
      isSelected: true,
      animationController: null,
    ),
    'GSTR3B': TabIconData(
      tabName: 'GSTR3B',
      imagePath: 'assets/images/tab_2.png',
      selectedImagePath: 'assets/images/tab_2s.png',
      // index: 1,
      isSelected: false,
      animationController: null,
    ),
    'GSTR1': TabIconData(
      tabName: 'GSTR1',
      imagePath: 'assets/images/tab_3.png',
      selectedImagePath: 'assets/images/tab_3s.png',
      // index: 2,
      isSelected: false,
      animationController: null,
    ),
    'GSTR9': TabIconData(
      tabName: 'GSTR9',
      imagePath: 'assets/images/tab_4.png',
      selectedImagePath: 'assets/images/tab_4s.png',
      // index: 3,
      isSelected: false,
      animationController: null,
    ),
  };
}
