import 'dart:convert';
import 'package:chat/models/user.dart';
import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http;

import 'package:chat/global/environment.dart';
import 'package:chat/models/login_response.dart';


class AuthService with ChangeNotifier {

  User user;
  bool _autenticando = false; 


  bool get autenticando => this._autenticando; 
  set autenticando( bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }

    
    Future<bool> login( String email, String password) async {

      this.autenticando = true;

      final data = {
        'email'   : email, 
        'password': password
      };
    
      final resp = await http.post('${ Environment.apiUrl }/login', 
        body: jsonEncode( data ), 
        headers: {
          'Content-Type': 'application/json'
        } 
      );

        print( resp.body );

        this.autenticando = false;

        if( resp.statusCode == 200){
          final loginResponse =  loginResponseFromJson( resp.body );
          this.user = loginResponse.user; 

   //TODO: Guardar token

          return true;
        } else {
          return false;
        }
       


    }

}