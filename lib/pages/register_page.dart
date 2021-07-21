import 'package:chat/widgets/botton.dart';
import 'package:chat/widgets/custon_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
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

                  Logo( title: 'Registro',),
               
                  _Form(),
            
                  Labels(route: 'login', title: 'Já tens conta?', subtitle: 'Então mbora entrar'),
               
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

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [

          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Name',
            keyborderType: TextInputType.text,
            controller: nameCtrl,
          ), 

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
            },
          )
        ],
      ),
    );
  }
}
