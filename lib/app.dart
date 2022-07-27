import 'package:financial_mindset/constants.dart';
import 'package:flutter/material.dart';
import 'screens/new_homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSwatch().copyWith(
          // or from RGB

          primary: middleBlueGreen,
          secondary: middleBlueGreen,
        ),
      ),
      home: const HomePage(title: appTitle),
      // home: const AllAffirmationsPage(title: appTitle),
    );
  }
}
