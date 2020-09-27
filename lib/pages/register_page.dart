import 'package:dogs/widgets/btn_blue.dart';
import 'package:dogs/widgets/custom_input.dart';
import 'package:dogs/widgets/labels.dart';
import 'package:dogs/widgets/logo.dart';
import 'package:flutter/material.dart';

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
          text: 'Ingresar',
          onPressed: () {
            print(emailCtrl.text);
            print(passCtrl.text);
          },
        )
      ]),
    );
  }
}
