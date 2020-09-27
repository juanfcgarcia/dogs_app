import 'package:flutter/material.dart';
import 'package:dogs/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dogs App',
      initialRoute: 'login',
      routes: appRoutes,
    );
  }
}
