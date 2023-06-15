import 'package:amazonclone/constants/global_variables.dart';
import 'package:amazonclone/features/screens/auth_screen.dart';
import 'package:amazonclone/features/widgets/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: const AppBarTheme(elevation: 0),
          iconTheme: const IconThemeData(
            color: Colors.black,
          )),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Hello!'),
          ),
          body: Column(
            children: [
              const Center(
                child: Text('Flutter Demo Page'),
              ),
              Builder(builder: (context) {
                return ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AuthScreen.routeName);
                    },
                    child: const Text('click'));
              })
            ],
          )),
    );
  }
}
