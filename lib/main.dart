import 'package:amazonclone/common/widgets/bottom_bar.dart';
import 'package:amazonclone/constants/features/services/auth_service.dart';
import 'package:amazonclone/constants/global_variables.dart';
import 'package:amazonclone/constants/features/screens/auth_screen.dart';
import 'package:amazonclone/constants/features/widgets/router.dart';
import 'package:amazonclone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MaterialApp(home: MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // AuthService.GetUserData(context: context);
    final authService = AuthService(); // Create an instance of the AuthService
    // Access the GetUserData instance member using the authService instance
    authService.GetUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'E-commerce App',
        theme: ThemeData(
            scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            colorScheme: const ColorScheme.light(
                primary: GlobalVariables.secondaryColor),
            appBarTheme: const AppBarTheme(elevation: 0),
            iconTheme: const IconThemeData(
              color: Colors.black,
            )),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? const BottomBar()
            : const AuthScreen());
  }
}
