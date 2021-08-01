import 'dart:convert';

import 'package:chat/global/environment.dart';
import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {

    
    Future login( String email, String password) async {

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

    }

}