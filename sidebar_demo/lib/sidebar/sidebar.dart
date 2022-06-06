import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sidebar_demo/sidebar/menu_item.dart';

import '../bloc_navigation/navigation_bloc.dart';

class SideBar extends StatefulWidget {
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpenedStreamController;
  late Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;
  // bool isSidebarOpen = true;

  final _animationDuration = Duration(milliseconds: 500);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isSidebarOpenedStreamController.close();
    _animationController.dispose();
  }

  onIconPressed() {
    AnimationStatus animationstatus = _animationController.status;
    bool isAnimationCompleted = animationstatus == AnimationStatus.completed;
    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return StreamBuilder<bool>(
        initialData: false,
        stream: isSidebarOpenedStream,
        builder: (context, isSidebarOpenedAsync) {
          return AnimatedPositioned(
            duration: _animationDuration,
            top: 0,
            bottom: 0,
            left: isSidebarOpenedAsync.data! ? 0 : -deviceSize.width,
            right: isSidebarOpenedAsync.data! ? 0 : deviceSize.width - 45,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Color(0xFF262AAA),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      ListTile(
                        title: Text("Mohit",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w800)),
                        subtitle: Text("mohitsmalik2038@gmail.com",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 20)),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      SidebarMenuItem(
                          icon: Icons.home,
                          title: "Home",
                          onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(
                                HomePageClickedEvent());
                          }),
                      SidebarMenuItem(
                          icon: Icons.person,
                          title: "My Account",
                          onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(
                                MyAccountPageClickedEvent());
                          }),
                      SidebarMenuItem(
                          icon: Icons.shopping_basket,
                          title: "Orders",
                          onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(
                                OrderPageClickedEvent());
                          }),
                      SidebarMenuItem(
                          icon: Icons.card_giftcard,
                          title: "Wish List",
                          onTap: () {}),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      SidebarMenuItem(
                          icon: Icons.settings,
                          title: "Settings",
                          onTap: () {}),
                      SidebarMenuItem(
                          icon: Icons.logout, title: "Logout", onTap: () {}),
                    ],
                  ),
                )),
                Align(
                  alignment: Alignment(0, -0.9),
                  child: GestureDetector(
                    onTap: () {
                      onIconPressed();
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      color: Color(0xFF262AAA),
                      width: 35,
                      height: 110,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Color(0xFF1BB5FD),
                        size: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
