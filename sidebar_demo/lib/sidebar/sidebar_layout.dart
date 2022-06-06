import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebar_demo/bloc_navigation/navigation_bloc.dart';

import '../pages/homepage.dart';
import 'sidebar.dart';

class SideBarLayout extends StatelessWidget {
  const SideBarLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(NavigationStates(HomePage())),
        child: Stack(
          children: [
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) => navigationState.widget,
            ),
            SideBar()
          ],
        ),
      ),
    );
  }
}
