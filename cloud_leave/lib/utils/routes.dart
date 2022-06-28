import 'package:cloud_leave/bindings/bill_binding.dart';
import 'package:cloud_leave/bindings/bill_list_binding.dart';
import 'package:cloud_leave/bindings/home_binding.dart';
import 'package:cloud_leave/bindings/leave_binding.dart';
import 'package:cloud_leave/bindings/leave_list_binding.dart';
import 'package:cloud_leave/bindings/new_bill_binding.dart';
import 'package:cloud_leave/bindings/new_leave_binding.dart';
import 'package:cloud_leave/bindings/new_work_binding.dart';
import 'package:cloud_leave/bindings/notification_binding.dart';
import 'package:cloud_leave/bindings/person_binding.dart';
import 'package:cloud_leave/bindings/signin_binding.dart';
import 'package:cloud_leave/bindings/signup_binding.dart';
import 'package:cloud_leave/bindings/team_binding.dart';
import 'package:cloud_leave/bindings/work_binding.dart';
import 'package:cloud_leave/bindings/work_list_binding.dart';
import 'package:cloud_leave/pages/bill_list_page.dart';
import 'package:cloud_leave/pages/bill_page.dart';
import 'package:cloud_leave/pages/home_page.dart';
import 'package:cloud_leave/pages/leave_list_page.dart';
import 'package:cloud_leave/pages/leave_page.dart';
import 'package:cloud_leave/pages/new_bill_page.dart';
import 'package:cloud_leave/pages/new_leave_page.dart';
import 'package:cloud_leave/pages/new_work_page.dart';
import 'package:cloud_leave/pages/notification_page.dart';
import 'package:cloud_leave/pages/person_page.dart';
import 'package:cloud_leave/pages/signin_page.dart';
import 'package:cloud_leave/pages/signup_page.dart';
import 'package:cloud_leave/pages/team_page.dart';
import 'package:cloud_leave/pages/work_list_page.dart';
import 'package:cloud_leave/pages/work_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Routes {
  static final List<GetPage> pages = <GetPage>[
    GetPage(
      name: "/",
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: "/billList",
      page: () => const BillListPage(),
      binding: BillListBinding(),
      middlewares: [RouteMiddle()],
    ),
    GetPage(
      name: "/bill",
      page: () => const BillPage(),
      binding: BillBinding(),
      middlewares: [RouteMiddle()],
    ),
    GetPage(
      name: "/leaveList",
      page: () => const LeaveListPage(),
      binding: LeaveListBinding(),
      middlewares: [RouteMiddle()],
    ),
    GetPage(
      name: "/leave",
      page: () => const LeavePage(),
      binding: LeaveBinding(),
      middlewares: [RouteMiddle()],
    ),
    GetPage(
      name: "/newBill",
      page: () => const NewBillPage(),
      binding: NewBillBinding(),
      middlewares: [RouteMiddle()],
    ),
    GetPage(
      name: "/newLeave",
      page: () => const NewLeavePage(),
      binding: NewLeaveBinding(),
      middlewares: [RouteMiddle()],
    ),
    GetPage(
      name: "/newWork",
      page: () => const NewWorkPage(),
      binding: NewWorkBinding(),
      middlewares: [RouteMiddle()],
    ),
    GetPage(
      name: "/notification",
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
      middlewares: [RouteMiddle()],
    ),
    GetPage(
      name: "/person",
      page: () => const PersonPage(),
      binding: PersonBinding(),
      middlewares: [RouteMiddle()],
    ),
    GetPage(
      name: "/signin",
      page: () => const SigninPage(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: "/signup",
      page: () => const SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: "/team",
      page: () => const TeamPage(),
      binding: TeamBinding(),
      middlewares: [RouteMiddle()],
    ),
    GetPage(
      name: "/workList",
      page: () => const WorkListPage(),
      binding: WorkListBinding(),
      middlewares: [RouteMiddle()],
    ),
    GetPage(
      name: "/work",
      page: () => const WorkPage(),
      binding: WorkBinding(),
      middlewares: [RouteMiddle()],
    ),
  ];
}

class RouteMiddle extends GetMiddleware {
  final GetStorage _storage = GetStorage();
  @override
  RouteSettings? redirect(String? route) {
    if (_storage.read("userID") != null) {
      return super.redirect(route);
    } else {
      return const RouteSettings(name: "/signin");
    }
  }
}
