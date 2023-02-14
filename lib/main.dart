import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:notefire/injection.dart';

void main() {
  configureInjection(Environment.dev);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          body: SizedBox(
            child: Text('data'),
          ),
        ));
  }
}
