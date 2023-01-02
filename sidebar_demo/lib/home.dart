import 'package:flutter/material.dart';
import 'package:sidebar_demo/BottomBar.dart';
import 'package:sidebar_demo/MyDrawer.dart';
import 'package:sidebar_demo/testing.dart';

import 'TableIconData.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Widget MyContainer = Container(
    height: 20,
    width: double.infinity,
    color: Colors.blue,
  );
  List<TabIconData> tabIconsList = [
    TabIconData.tabIconsList['Home']!,
    TabIconData.tabIconsList['Invoices']!,
    TabIconData.tabIconsList['Inventory']!,
    TabIconData.tabIconsList['Settings']!
  ];
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      // body: Column(
      //   children: [
      //     MyContainer,
      //     MyContainer,
      //     MyContainer,
      //     MyContainer,
      //     MyContainer,
      //     MyContainer,
      //     MyContainer,
      //     MyContainer,
      //     MyContainer,
      //     MyContainer,
      //     MyContainer,
      //     MyContainer,
      //     MyContainer,
      //   ],
      // ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.blue,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: Drawer(
        width: deviceSize.width * 0.65,
        child: MyDrawer(''),
      ),
      bottomNavigationBar: BottomAppBar(
        child: BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
            } else if (index == 1) {
            } else if (index == 2) {
            } else if (index == 3) {}
          },
        ),
      ),
    );
  }
}
