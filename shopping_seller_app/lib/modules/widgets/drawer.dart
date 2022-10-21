import 'package:flutter/material.dart';
import 'package:shopping_seller_app/config/constants/AppConstants.dart';

import '../models/drawer_option.dart';

class myDrawer extends StatelessWidget {
  late String userid;
  myDrawer(this.userid,this.drawer_options);
  late List<DrawerOption> drawer_options;
  _navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route, arguments: {'userid': userid});
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Container(
              height: 200,
              child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png'),
                  ),
                  accountName: Text(userid.split("@")[0],
                      style: TextStyle(fontSize: 20)),
                  accountEmail: Text(userid, style: TextStyle(fontSize: 15)))),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 1.5,
            color: Color.fromARGB(255, 143, 136, 136),
          ),
          Container(
            height: 300,
            child: ListView.builder(
                itemCount: drawer_options.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: drawer_options[index].isActive
                        ? Colors.white
                        : Colors.blue,
                    child: ListTile(
                      onTap: () {
                        _navigateTo(context, drawer_options[index].route);
                      },
                      minVerticalPadding: 1,
                      leading: Text(drawer_options[index].name,
                          style: TextStyle(
                              color: drawer_options[index].isActive
                                  ? Colors.blue
                                  : Colors.white,
                              fontSize: 18)),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
