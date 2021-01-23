import 'package:akademik/routes/akademik_router.gr.dart';
import 'package:akademik/screens/home/home.dart';
import 'package:akademik/screens/login/login.dart';
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
