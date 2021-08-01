import 'dart:convert';

import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:chat/global/environment.dart';
import 'package:chat/models/login_response.dart';
import 'package:chat/models/user.dart';


class AuthService with ChangeNotifier {

  User user;
  bool _autenticando = false; 

  //Criar instancia do storage
  final _storage = new FlutterSecureStorage();


  bool get autenticando => this._autenticando; 
  set autenticando( bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }

  //Getters do token de forma estatica 
   static Future<String> getToken() async {
      final _storage = new FlutterSecureStorage();
      final token = await _storage.read(key: 'token'); 
      return token;
   }

    static Future<void> deleteToken() async {
      final _storage = new FlutterSecureStorage();
      await _storage.delete(key: 'token'); 
  
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

          //Guardar token 
         await this._guardarToken( loginResponse.token);

          return true;
        } else {
          return false;
        }
      
    }

     // Guardar Token
    Future _guardarToken( String token) async {
     return await _storage.write(key: 'token', value: token);
    }
    
    //Deletar valor
    Future logout() async{
     await _storage.delete(key: 'token');
    }

}