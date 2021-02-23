import 'package:akademik/screens/admin_menu/admin_menu.dart';
import 'package:akademik/screens/attendance/attendance.dart';
import 'package:akademik/screens/exams/exams.dart';
import 'package:akademik/screens/grades/grades.dart';
import 'package:akademik/screens/home/home.dart';
import 'package:akademik/screens/homework/homework.dart';
import 'package:akademik/screens/login/login.dart';
import 'package:akademik/screens/menu/menu.dart';
import 'package:akademik/screens/news/news.dart';
import 'package:akademik/screens/news/news_item_screen/news_item_screen.dart';
import 'package:akademik/screens/notes/note_edit/note_edit_screen.dart';
import 'package:akademik/screens/notes/notes_list.dart';
import 'package:akademik/screens/profile/profile.dart';
import 'package:auto_route/auto_route_annotations.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AdaptiveRoute(page: AuthScreen),
  AdaptiveRoute(page: HomeScreen),
  AdaptiveRoute(page: MenuScreen),
  AdaptiveRoute(page: AdminMenuScreen),
  AdaptiveRoute(page: HomeworkScreen),
  AdaptiveRoute(page: AttendanceScreen),
  AdaptiveRoute(page: ExamsScreen),
  AdaptiveRoute(page: NewsScreen),
  AdaptiveRoute(page: NewsItemScreen),
  AdaptiveRoute(page: GradesScreen),
  AdaptiveRoute(page: NotesListScreen),
  AdaptiveRoute(page: NoteEditScreen),
  AdaptiveRoute(page: ProfileScreen),
])
class $AkademikRouter {}
