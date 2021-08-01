import 'package:flutter/material.dart';

import 'package:chat/widgets/botton.dart';
import 'package:chat/widgets/custon_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';


import 'package:provider/provider.dart';
import 'package:chat/services/auth_service.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(title: 'Login'),
                  _Form(),
                  Labels(
                    route: 'register',
                    title: 'Não tens uma conta?',
                    subtitle: 'Criar uma conta agora!',
                  ),
                  Text('Termos e condicoes de uso',
                      style: TextStyle(fontWeight: FontWeight.w200))
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) { 

  final authService = Provider.of<AuthService>(context, listen: false);

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(

        children: [

          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Email',
            keyborderType: TextInputType.emailAddress,
            controller: emailCtrl,
          ),

          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            keyborderType: TextInputType.numberWithOptions(decimal: true),
            controller: passwordCtrl,
            isPassword: true,
          ),

          Bottom(
            text: 'Entrar',
            color: Colors.blue,
            onPressed: () {
              print(emailCtrl.text);
              print(passwordCtrl.text);
              
              authService.login(emailCtrl.text, passwordCtrl.text);
            },
          )

        ],

      ),
    );
  }
}
