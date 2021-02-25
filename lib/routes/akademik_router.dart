import 'package:akademik/screens/admin/admin_homework/admin_homework.dart';
import 'package:akademik/screens/admin/admin_menu/admin_menu.dart';
import 'package:akademik/screens/user/attendance/attendance.dart';
import 'package:akademik/screens/user/exams/exams.dart';
import 'package:akademik/screens/user/grades/grades.dart';
import 'package:akademik/screens/user/home/home.dart';
import 'package:akademik/screens/user/homework/homework.dart';
import 'package:akademik/screens/user/login/login.dart';
import 'package:akademik/screens/user/menu/menu.dart';
import 'package:akademik/screens/user/news/news.dart';
import 'package:akademik/screens/user/news/news_item_screen/news_item_screen.dart';
import 'package:akademik/screens/user/notes/note_edit/note_edit_screen.dart';
import 'package:akademik/screens/user/notes/notes_list.dart';
import 'package:akademik/screens/user/profile/profile.dart';
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
  AdaptiveRoute(page: AdminHomeworkScreen)
])
class $AkademikRouter {}
