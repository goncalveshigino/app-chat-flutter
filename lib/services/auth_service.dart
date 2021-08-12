import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:chat/global/environment.dart';
import 'package:chat/models/login_response.dart';
import 'package:chat/models/user.dart';

class AuthService with ChangeNotifier {

  User _user;
  bool _loading = false;
 
 
  User get user => this._user; 
  set user(User user) {
    this._user = user;
    notifyListeners();
  }


  //Criar instancia do storage
  final _storage = new FlutterSecureStorage();

//Get loading
  bool get loading => this._loading;
  set loading(bool value) {
    this._loading = value;
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



  Future<bool> login(String email, String password) async {
    this.loading = true;

    final data = {'email': email, 'password': password};

    final resp = await http.post('${Environment.apiUrl}/login',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    this.loading = false;

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.user = loginResponse.user;

      //Guardar token
      await this._saveToken(loginResponse.token);

      return true;
    } else {
      return false;
    }
  }



  Future register(String name, String email, String password) async {
    this.loading = true;

    final data = {
      'name': name,
      'email': email,
      'password': password,
    };

    final resp = await http.post('${Environment.apiUrl}/login/new',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    this.loading = false;

    if (resp.statusCode == 200) {
      final registerResp = loginResponseFromJson(resp.body);
      this.user = registerResp.user;

      //Guardar o token
      await this._saveToken(registerResp.token);

      return true;
    } else {
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }
  }



  //Verificar o token armazenado no storage e se ainda  é válido
  Future isLoggedIn() async {
    final token = await this._storage.read(key: 'token');

    final resp = await http.get('${Environment.apiUrl}/login/renew',
        headers: {'Content-Type': 'application/joson', 'x-token': token});

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.user = loginResponse.user;

      await this._saveToken(loginResponse.token);

      return true;
    } else {
      this.logout();
      return false;
    }
  }
  

  // Guardar Token
  Future _saveToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  //Deletar valor
  Future logout() async {
    await _storage.delete(key: 'token');
  }
}
