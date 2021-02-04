// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';

import '../screens/attendance/attendance.dart';
import '../screens/exams/exams.dart';
import '../screens/home/home.dart';
import '../screens/homework/homework.dart';
import '../screens/login/login.dart';
import '../screens/menu/menu.dart';
import '../screens/news/news.dart';

class Routes {
  static const String authScreen = '/auth-screen';
  static const String homeScreen = '/home-screen';
  static const String menuScreen = '/menu-screen';
  static const String homeworkScreen = '/homework-screen';
  static const String attendanceScreen = '/attendance-screen';
  static const String examsScreen = '/exams-screen';
  static const String newsScreen = '/news-screen';
  static const all = <String>{
    authScreen,
    homeScreen,
    menuScreen,
    homeworkScreen,
    attendanceScreen,
    examsScreen,
    newsScreen,
  };
}

class AkademikRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.authScreen, page: AuthScreen),
    RouteDef(Routes.homeScreen, page: HomeScreen),
    RouteDef(Routes.menuScreen, page: MenuScreen),
    RouteDef(Routes.homeworkScreen, page: HomeworkScreen),
    RouteDef(Routes.attendanceScreen, page: AttendanceScreen),
    RouteDef(Routes.examsScreen, page: ExamsScreen),
    RouteDef(Routes.newsScreen, page: NewsScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    AuthScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => AuthScreen(),
        settings: data,
      );
    },
    HomeScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => HomeScreen(),
        settings: data,
      );
    },
    MenuScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => MenuScreen(),
        settings: data,
      );
    },
    HomeworkScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => HomeworkScreen(),
        settings: data,
      );
    },
    AttendanceScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => AttendanceScreen(),
        settings: data,
      );
    },
    ExamsScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ExamsScreen(),
        settings: data,
      );
    },
    NewsScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => NewsScreen(),
        settings: data,
      );
    },
  };
}
