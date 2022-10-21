import 'package:flutter/material.dart';
import 'package:shopping_seller_app/modules/widgets/drawer.dart';

import '../../config/constants/AppConstants.dart';
import '../Services/drawer_options_list.dart';
import '../models/drawer_option.dart';
import '../widgets/add_product.dart';
import '../widgets/view_product.dart';

class manageProducts extends StatefulWidget {
  const manageProducts({ Key? key }) : super(key: key);

  @override
  State<manageProducts> createState() => _manageProductsState();
}

class _manageProductsState extends State<manageProducts> {
  
  DrawerOptionList list = DrawerOptionList();
// List<Map<String, dynamic>> _loadAllPages() {
  //   return [
  //     {'page': AddPrduct(), 'title': 'Add Product', 'icon': Icons.add},
  //     {'page': ViewProduct(), 'title': 'View Product', 'icon': Icons.list}
  //   ];
  // }
  int flag = 0;
  List<Map<String, dynamic>> _loadAllPages() {
    return [
      {
        'page': AddPrduct(refreshChild, switchChild, flag),
        'title': 'Add Product',
        'icon': Icons.add
      },
      {'page': ViewProduct(), 'title': 'View Product', 'icon': Icons.list}
    ];
  }

  switchChild() {
    currentPage = currentPage == 0 ? 1 : 0;
    setState(() {});
  }

  refreshChild() {
    flag++;
    setState(() {});
  }

  int currentPage = 0;
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  late List<Map<String, dynamic>> _allPages;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _allPages = _loadAllPages();
  }

  openBottomDialog() {
    scaffoldkey.currentState?.showBottomSheet((context) {
      return Container(
        height: 200,
        color: Colors.lightBlueAccent,
        child: Column(children: [
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone Calls'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone Calls'),
          )
        ]),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
        List<DrawerOption> drawer_options_list = list.drawer_options;
    drawer_options_list = drawer_options_list.map((drawerOption) {
      if (drawerOption.name == AppBarTitle.MANAGE_PRODUCTS) {
        drawerOption.isActive = true;
        return drawerOption;
      } else {
        return drawerOption;
      }
    }).toList();
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String userid = arguments['userid'];
    // String arguments = ModalRoute.of(context)!.settings.arguments as String; // we can also use any other data type but map is standard form of sending data becuas ewe just have to call the key we don't have to remember the index of data member
    // String userid = arguments;
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(title: Text(AppBarTitle.MANAGE_PRODUCTS),actions: [],),
      drawer: Drawer(
          child: myDrawer(userid,drawer_options_list)
          ),
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.only(top: 10),
              child: _loadAllPages()[currentPage]['page'])),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (int currentPageIndex) {
            currentPage = currentPageIndex;
            setState(() {});
          },
          items: _allPages
              .map((element) => BottomNavigationBarItem(
                  icon: Icon(element['icon']),
                  label: element['title']))
              .toList()
          // ]
          ),
    );
  }
}