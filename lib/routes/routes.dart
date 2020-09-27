import 'package:flutter/material.dart';

import 'package:dogs/pages/loading_page.dart';
import 'package:dogs/pages/login_page.dart';
import 'package:dogs/pages/users_page.dart';
import 'package:dogs/pages/home_page.dart';
import 'package:dogs/pages/register_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'users': (_) => UsersPage(),
  'home': (_) => HomePage(),
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'loading': (_) => LoadingPage(),
};
