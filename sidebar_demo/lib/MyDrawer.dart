import 'package:flutter/material.dart';

import 'Theme.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer(this.current_page);
  String current_page;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

enum DrawerIndex { HOME, Payment, Quotation, Client, About, Expense, GST }

class DrawerList {
  DrawerList({
    this.isAssetsImage = false,
    this.labelName = '',
    this.icon,
    this.index,
    this.imageName = '',
  });

  String labelName;
  Icon? icon;
  bool isAssetsImage;
  String imageName;
  DrawerIndex? index;
}

class _MyDrawerState extends State<MyDrawer> with TickerProviderStateMixin {
  late AnimationController iconAnimationController;

  List drawerList = <DrawerList>[
    DrawerList(
      index: DrawerIndex.GST,
      labelName: 'Home',
      icon: const Icon(Icons.home),
    ),
    DrawerList(
        index: DrawerIndex.Quotation,
        labelName: 'Quotation',
        icon: const Icon(Icons.description_outlined)),
    DrawerList(
      index: DrawerIndex.Payment,
      labelName: 'Payment',
      icon: const Icon(Icons.payment),
    ),
    DrawerList(
      index: DrawerIndex.Expense,
      labelName: 'Expense',
      icon: const Icon(Icons.credit_card_outlined),
    ),
    DrawerList(
      index: DrawerIndex.Client,
      labelName: 'Client/Vendor',
      icon: const Icon(Icons.group_rounded),
    ),
    DrawerList(
      index: DrawerIndex.GST,
      labelName: 'GST',
      icon: const Icon(Icons.info),
    ),
  ];

  initState() {
    super.initState();
    iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  List<Map<String, dynamic>> menu = [{}];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        backgroundColor: AppTheme.notWhite.withOpacity(0.5),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppTheme.loginGradientStart, AppTheme.loginGradientEnd],
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      AnimatedBuilder(
                        animation: iconAnimationController,
                        builder: (BuildContext context, Widget? child) {
                          return ScaleTransition(
                            scale: AlwaysStoppedAnimation<double>(
                                1.0 - (iconAnimationController.value) * 0.2),
                            child: RotationTransition(
                              turns: AlwaysStoppedAnimation<double>(
                                  Tween<double>(begin: 0.0, end: 24.0)
                                          .animate(CurvedAnimation(
                                              parent: iconAnimationController,
                                              curve: Curves.fastOutSlowIn))
                                          .value /
                                      360),
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: AppTheme.grey.withOpacity(0.6),
                                        offset: const Offset(2.0, 4.0),
                                        blurRadius: 8),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(60.0)),
                                  child: Image.asset(
                                      'assets/images/userImage.png'),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8, left: 4),
                        child: Text(
                          'Chris Hemsworth',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Divider(
                height: 1,
                color: AppTheme.grey.withOpacity(0.6),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(0.0),
                  itemCount: drawerList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return inkwell(drawerList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inkwell(DrawerList listData) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          navigationtoScreen(listData.index!);
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 6.0,
                    height: 46.0,
                    decoration: BoxDecoration(
                      color: DrawerIndex.GST == listData.index
                          ? Colors.white
                          : Colors.transparent,
                      borderRadius: new BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  listData.isAssetsImage
                      ? Container(
                          width: 24,
                          height: 24,
                          child: Image.asset(listData.imageName,
                              color: DrawerIndex.GST == listData.index
                                  ? Colors.blue
                                  : AppTheme.nearlyBlack),
                        )
                      : Icon(listData.icon?.icon,
                          color: DrawerIndex.GST == listData.index
                              ? Colors.white
                              : AppTheme.white),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  Text(
                    listData.labelName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: DrawerIndex.GST == listData.index
                          ? Colors.white
                          : AppTheme.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            DrawerIndex.GST == listData.index
                ? AnimatedBuilder(
                    animation: iconAnimationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        transform: Matrix4.translationValues(
                            (MediaQuery.of(context).size.width * 0.75 - 64) *
                                (1.0 - iconAnimationController.value - 1.0),
                            0.0,
                            0.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Container(
                            width:
                                MediaQuery.of(context).size.width * 0.75 - 64,
                            height: 46,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(0),
                                topRight: const Radius.circular(28),
                                bottomLeft: const Radius.circular(0),
                                bottomRight: const Radius.circular(28),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Future<void> navigationtoScreen(DrawerIndex indexScreen) async {}
}
