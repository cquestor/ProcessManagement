import 'package:app/bindings/main_binding.dart';
import 'package:app/bindings/new_leave_binding.dart';
import 'package:app/pages/analyse_page.dart';
import 'package:app/pages/bill_page.dart';
import 'package:app/pages/fieldwork_page.dart';
import 'package:app/pages/group_page.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/leave_list_page.dart';
import 'package:app/pages/main_page.dart';
import 'package:app/pages/new_leave_page.dart';
import 'package:app/pages/notification_page.dart';
import 'package:app/pages/person_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage> pages = <GetPage>[
    GetPage(
      name: "/",
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: "/newleave",
      page: () => const NewLeavePage(),
      binding: NewLeaveBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: "/leavelist",
      page: () => const LeaveListPage(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: "/bill",
      page: () => const BillPage(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: "/fieldwork",
      page: () => const FieldworkPage(),
      middlewares: [AuthMiddleware()],
    ),
  ];

  static List<Widget> contents = const <Widget>[
    HomePage(),
    AnalysePage(),
    GroupPage(),
    NotificationPage(),
    PersonPage(),
  ];
}

class AuthMiddleware extends GetMiddleware {
  bool isAuthenticated = true;

  @override
  RouteSettings? redirect(String? route) {
    if (!isAuthenticated) {
      return const RouteSettings(name: "/bill");
    }
    return super.redirect(route);
  }
}
