import 'package:dogs/widgets/btn_blue.dart';
import 'package:dogs/widgets/custom_input.dart';
import 'package:dogs/widgets/labels.dart';
import 'package:dogs/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dogs/services/auth_services.dart';
import 'package:dogs/helpers/show_alert.dart';

class RegisterPage extends StatelessWidget {
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
                  title: 'Registro',
                ),
                _Form(),
                Labels(
                  path: 'login',
                  lblTitle: '¿Ya tienes una cuenta?',
                  lblSubtitle: 'Ingresa ahora',
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
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: <Widget>[
        CustomInput(
          icon: Icons.perm_identity,
          placeholder: 'Nombre',
          keyboardType: TextInputType.text,
          textController: nameCtrl,
        ),
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
          text: 'Crear cuenta',
          onPressed: authService.authenticating
              ? null
              : () async {
                  print(emailCtrl.text);
                  print(passCtrl.text);
                  final registerOk = await authService.register(
                      nameCtrl.text.trim(),
                      emailCtrl.text.trim(),
                      passCtrl.text.trim());

                  if (registerOk == true) {
                    Navigator.pushReplacementNamed(context, 'home');
                  } else {
                    showAlert(context, 'Registro Incorrecto', registerOk);
                  }
                },
        )
      ]),
    );
  }
}
