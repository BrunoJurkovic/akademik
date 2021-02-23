// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../providers/news.dart';
import '../providers/notes.dart';
import '../screens/admin_menu/admin_menu.dart';
import '../screens/attendance/attendance.dart';
import '../screens/exams/exams.dart';
import '../screens/grades/grades.dart';
import '../screens/home/home.dart';
import '../screens/homework/homework.dart';
import '../screens/login/login.dart';
import '../screens/menu/menu.dart';
import '../screens/news/news.dart';
import '../screens/news/news_item_screen/news_item_screen.dart';
import '../screens/notes/note_edit/note_edit_screen.dart';
import '../screens/notes/notes_list.dart';
import '../screens/profile/profile.dart';

class Routes {
  static const String authScreen = '/auth-screen';
  static const String homeScreen = '/home-screen';
  static const String menuScreen = '/menu-screen';
  static const String adminMenuScreen = '/admin-menu-screen';
  static const String homeworkScreen = '/homework-screen';
  static const String attendanceScreen = '/attendance-screen';
  static const String examsScreen = '/exams-screen';
  static const String newsScreen = '/news-screen';
  static const String newsItemScreen = '/news-item-screen';
  static const String gradesScreen = '/grades-screen';
  static const String notesListScreen = '/notes-list-screen';
  static const String noteEditScreen = '/note-edit-screen';
  static const String profileScreen = '/profile-screen';
  static const all = <String>{
    authScreen,
    homeScreen,
    menuScreen,
    adminMenuScreen,
    homeworkScreen,
    attendanceScreen,
    examsScreen,
    newsScreen,
    newsItemScreen,
    gradesScreen,
    notesListScreen,
    noteEditScreen,
    profileScreen,
  };
}

class AkademikRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.authScreen, page: AuthScreen),
    RouteDef(Routes.homeScreen, page: HomeScreen),
    RouteDef(Routes.menuScreen, page: MenuScreen),
    RouteDef(Routes.adminMenuScreen, page: AdminMenuScreen),
    RouteDef(Routes.homeworkScreen, page: HomeworkScreen),
    RouteDef(Routes.attendanceScreen, page: AttendanceScreen),
    RouteDef(Routes.examsScreen, page: ExamsScreen),
    RouteDef(Routes.newsScreen, page: NewsScreen),
    RouteDef(Routes.newsItemScreen, page: NewsItemScreen),
    RouteDef(Routes.gradesScreen, page: GradesScreen),
    RouteDef(Routes.notesListScreen, page: NotesListScreen),
    RouteDef(Routes.noteEditScreen, page: NoteEditScreen),
    RouteDef(Routes.profileScreen, page: ProfileScreen),
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
    AdminMenuScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => AdminMenuScreen(),
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
    NewsItemScreen: (data) {
      final args = data.getArgs<NewsItemScreenArguments>(
        orElse: () => NewsItemScreenArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => NewsItemScreen(
          key: args.key,
          newsItem: args.newsItem,
        ),
        settings: data,
      );
    },
    GradesScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => GradesScreen(),
        settings: data,
      );
    },
    NotesListScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => NotesListScreen(),
        settings: data,
      );
    },
    NoteEditScreen: (data) {
      final args = data.getArgs<NoteEditScreenArguments>(
        orElse: () => NoteEditScreenArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => NoteEditScreen(
          key: args.key,
          noteItem: args.noteItem,
        ),
        settings: data,
      );
    },
    ProfileScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ProfileScreen(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// NewsItemScreen arguments holder class
class NewsItemScreenArguments {
  final Key key;
  final AkademikNews newsItem;
  NewsItemScreenArguments({this.key, this.newsItem});
}

/// NoteEditScreen arguments holder class
class NoteEditScreenArguments {
  final Key key;
  final AkademikNote noteItem;
  NoteEditScreenArguments({this.key, this.noteItem});
}
