import 'package:churchly/src/churchly/presentation/screens/responsive/mobile_view.dart';
import 'package:churchly/src/churchly/presentation/screens/responsive/tablet_view.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_loading_view.dart';
import 'package:churchly/src/churchly/presentation/screens/responsive/login_view.dart';
import 'package:flutter/material.dart';

class DRoutes {
  final _dInitialRoute = '/';
  // Widget Function(BuildContext)
  final _routes = <String, Widget Function(BuildContext)>{
    '/mobileView': (context) => const MobileView(),
    '/tabletView': (context) => const TabletView(),
    // '/financeView': (context) => const FinanceView(),
    '/loadingView': (context) => const LoadingView(),
    '/loginView': (context) => const LoginView(),
  };

  String get dInitialRoute => _dInitialRoute;
  Map<String, Widget Function(BuildContext)> get routes => _routes;
}
