import 'package:akademik/screens/home/home.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';

@AdaptiveAutoRouter(
    routes: <AutoRoute>[AdaptiveRoute(page: HomeScreen, initial: true)])
class $AkademikRouter {}
