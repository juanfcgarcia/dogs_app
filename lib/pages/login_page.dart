import 'package:dogs/helpers/show_alert.dart';
import 'package:dogs/services/auth_services.dart';
import 'package:dogs/widgets/btn_blue.dart';
import 'package:dogs/widgets/custom_input.dart';
import 'package:dogs/widgets/labels.dart';
import 'package:dogs/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff311b92),
        body: SafeArea(
            child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(
                  title: 'Dogs App',
                ),
                _Form(),
                Labels(
                  path: 'register',
                  lblTitle: '¿No tienes una cuenta?',
                  lblSubtitle: 'Crea una ahora',
                ),
                Text('-'),
              ],
            ),
          ),
        )));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: <Widget>[
        CustomInput(
          icon: Icons.mail_outline,
          placeholder: 'Correo',
          keyboardType: TextInputType.emailAddress,
          textController: emailCtrl,
        ),
        CustomInput(
          icon: Icons.lock_outline,
          placeholder: 'Contraseña',
          textController: passCtrl,
          isPasswrod: true,
        ),
        BtnBlue(
          text: 'Ingresar',
          onPressed: authService.authenticating
              ? null
              : () async {
                  FocusScope.of(context).unfocus();
                  final loginOk = await authService.login(
                      emailCtrl.text.trim(), passCtrl.text.trim());

                  if (loginOk) {
                    //Navegar a otra pantalla
                    Navigator.pushReplacementNamed(context, 'home');
                  } else {
                    //Mostrar alerta
                    showAlert(context, 'Login Incorrecto',
                        'Verifique su Correo y Contraseña');
                  }
                },
        )
      ]),
    );
  }
}
