import 'package:flutter/material.dart';
import 'package:notefire/presentation/auth/sin_in_page.dart';

class AppWiget extends StatelessWidget {
  const AppWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firenote',
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
      theme: ThemeData.light().copyWith(
          primaryColor: Colors.green[800],
          inputDecorationTheme: InputDecorationTheme(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)))),
    );
  }
}
