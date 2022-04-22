import 'package:flutter/material.dart';
import 'package:shopping_seller_app/modules/widgets/add_product.dart';
import 'package:shopping_seller_app/modules/widgets/view_product.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Map<String, dynamic>> _loadAllPages() {
    return [
      {'page': AddPrduct(), 'title': 'Add Product'},
      {'page': ViewProduct(), 'title': 'View Product'}
    ];
  }

  int currentPage = 0;
  late List<Map<String, dynamic>> _allPages;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _allPages = _loadAllPages();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _allPages[currentPage]['page']),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (int currentPageIndex) {
            currentPage = currentPageIndex;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.add),label: 'Add Product'),
            BottomNavigationBarItem(icon: Icon(Icons.list),label: 'View Product'),
          ]),
    );
  }
}
