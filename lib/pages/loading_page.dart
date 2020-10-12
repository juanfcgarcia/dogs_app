import 'package:dogs/pages/login_page.dart';
import 'package:dogs/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dogs/pages/home_page.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return Center(
            child: Text('Cargando...'),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);

    final authenticated = await authService.isLoggedIn();

    if (authenticated) {
      //Conectar al sockect server
      Navigator.pushReplacement(
          context, PageRouteBuilder(pageBuilder: (_, __, ___) => HomePage()));
    } else {
      Navigator.pushReplacement(
          context, PageRouteBuilder(pageBuilder: (_, __, ___) => LoginPage()));
    }
  }
}
