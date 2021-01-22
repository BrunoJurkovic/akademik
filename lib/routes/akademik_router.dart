import 'package:akademik/screens/home/home.dart';
import 'package:akademik/screens/login/login.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AdaptiveRoute(page: AuthScreen, initial: true),
  AdaptiveRoute(page: HomeScreen),
])
class $AkademikRouter {}
