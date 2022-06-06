import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebar_demo/pages/homepage.dart';
import 'package:sidebar_demo/pages/myaccountpage.dart';
import 'package:sidebar_demo/pages/orderspage.dart';

abstract class NavigationEvents {}

class HomePageClickedEvent extends NavigationEvents {}

class MyAccountPageClickedEvent extends NavigationEvents {}

class OrderPageClickedEvent extends NavigationEvents {}

// enum NavigationEvents {
//   HomePageClickedEvent,
//   MyAccountPageClicketEvent,
//   OrdersPageClickedEvent
// }
class NavigationStates {
  Widget widget;
  NavigationStates(this.widget);
}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(NavigationStates(HomePage())) {
    // @override
    // TODO: implement stream
    // Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    //   print(event);
    //   switch (event) {
    //     case NavigationEvents.HomePageClickedEvent:
    //       print("Home page called");
    //       yield HomePage();
    //       break;
    //     case NavigationEvents.MyAccountPageClicketEvent:
    //       yield MyAccountPage();
    //       break;
    //     case NavigationEvents.OrdersPageClickedEvent:
    //       yield OrdersPage();
    //       break;
    //   }
    // }
    on<HomePageClickedEvent>(
        (event, emit) => emit(NavigationStates(HomePage())));
    on<MyAccountPageClickedEvent>(
        (event, emit) => emit(NavigationStates(MyAccountPage())));
    on<OrderPageClickedEvent>(
        (event, emit) => emit(NavigationStates(OrdersPage())));    
  }
}
