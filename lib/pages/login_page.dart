import 'package:chat/widgets/botton.dart';
import 'package:chat/widgets/custon_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                   Logo(), 
                   SizedBox(height: 40,),
                  _Form(), 
                  SizedBox(height: 40,),
                  Labels(), 
                  SizedBox(height: 70,),
                  Text('Termos e condicoes de uso', style: TextStyle(fontWeight: FontWeight.w200))
                ],
              ),
            ],
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

           RaisedButton( 
             
             onPressed: (){ }, 

             child: Bottom()
           )

          ],
        ),
    );
  }
}

