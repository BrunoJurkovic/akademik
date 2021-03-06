import 'package:akademik/routes/akademik_router.gr.dart';
import 'package:akademik/services/attendance_repo.dart';
import 'package:akademik/services/exams_repo.dart';
import 'package:akademik/services/grades_repo.dart';
import 'package:akademik/services/homework_repo.dart';
import 'package:akademik/services/news_repo.dart';
import 'package:akademik/services/notes_repo.dart';
import 'package:akademik/services/user_repo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UserRepository(),
        ),
        ChangeNotifierProxyProvider<UserRepository, HomeworkRepository>(
          update: (ctx, users, previous) => HomeworkRepository(users),
          create: (ctx) => HomeworkRepository(null),
        ),
        ChangeNotifierProvider(
          create: (ctx) => NewsRepository(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AttendanceRepository(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ExamsRepository(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => GradeRepository(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => NotesRepository(),
        ),
      ],
      child: const AppStart(),
    );
  }
}

class AppStart extends StatelessWidget {
  const AppStart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: ExtendedNavigator.builder<AkademikRouter>(
        router: AkademikRouter(),
        initialRoute: Provider.of<UserRepository>(context).isUserLoggedIn
            ? '/auth-screen'
            : '/home-screen',
      ),
      onGenerateRoute: AkademikRouter(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
