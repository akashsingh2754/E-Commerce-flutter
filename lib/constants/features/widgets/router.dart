import 'package:amazonclone/common/widgets/bottom_bar.dart';
import 'package:amazonclone/constants/features/home/screen/home_screen.dart';
import 'package:amazonclone/constants/features/screens/auth_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {

    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

      case HomeScreen.routename:
         return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );

      case BottomBar.routename:
         return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
      
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("NO page exist"),
          ),
        ),
      );
  }
}
