import 'package:akademik/screens/home/home.dart';
import 'package:akademik/screens/login/login.dart';
import 'package:auto_route/auto_route_annotations.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AdaptiveRoute(page: AuthScreen),
  AdaptiveRoute(page: HomeScreen),
])
class $AkademikRouter {}
