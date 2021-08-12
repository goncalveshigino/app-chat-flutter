
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat/pages/user_page.dart';
import 'login_page.dart';  

import 'package:chat/services/auth_service.dart';
import 'package:chat/services/socket_services.dart';


class LoadingPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: FutureBuilder(
         future: chechLoginState( context),
         builder: ( context, snapshot){
           return Center(
             child: Text('Espere...'),
           );
         },
       ),
    );
  } 


  Future chechLoginState( BuildContext context) async {


    final authService = Provider.of<AuthService>(context, listen: false);
    final socketService = Provider.of<SocketService>(context, listen: false);

    final authenticated = await authService.isLoggedIn();

    if( authenticated ){
       socketService.connect();
      Navigator.pushReplacement(
        context, 
        PageRouteBuilder(
          pageBuilder: (_,__,___) => UserPage(), 
        )
      );
    } else {
    Navigator.pushReplacement(
        context, 
        PageRouteBuilder(
          pageBuilder: (_,__,___) => LoginPage(), 
        )
      );
    }

  }


}