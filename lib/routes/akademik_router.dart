import 'package:akademik/screens/attendance/attendance.dart';
import 'package:akademik/screens/exams/exams.dart';
import 'package:akademik/screens/home/home.dart';
import 'package:akademik/screens/homework/homework.dart';
import 'package:akademik/screens/login/login.dart';
import 'package:akademik/screens/menu/menu.dart';
import 'package:akademik/screens/news/news.dart';
import 'package:auto_route/auto_route_annotations.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AdaptiveRoute(page: AuthScreen),
  AdaptiveRoute(page: HomeScreen),
  AdaptiveRoute(page: MenuScreen),
  AdaptiveRoute(page: HomeworkScreen),
  AdaptiveRoute(page: AttendanceScreen),
  AdaptiveRoute(page: ExamsScreen),
  AdaptiveRoute(page: NewsScreen),
])
class $AkademikRouter {}
