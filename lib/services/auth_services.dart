import 'dart:convert';

import 'package:dogs/global/env.dart';
import 'package:dogs/models/login_response.dart';
import 'package:dogs/models/user.dart';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService with ChangeNotifier {
  User user;
  bool _authenticating = false;

  // Create storage
  final _storage = new FlutterSecureStorage();

  bool get authenticating => this._authenticating;
  set authenticating(bool value) {
    this._authenticating = value;
    notifyListeners();
  }

  //Getters del token de forma estatica
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
    this.authenticating = true;

    final data = {
      'email': email,
      'password': password,
    };

    final resp = await http.post('${Environment.apiUrl}/login',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    this.authenticating = false;
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.user = loginResponse.user;

      await this._savaToken(loginResponse.token);

      return true;
    } else {
      return false;
    }
  }

  Future register(String nombre, String email, String password) async {
    this.authenticating = true;

    final data = {
      'nombre': nombre,
      'email': email,
      'password': password,
    };

    final resp = await http.post('${Environment.apiUrl}/login/new',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    this.authenticating = false;
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.user = loginResponse.user;

      await this._savaToken(loginResponse.token);

      return true;
    } else {
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await this._storage.read(key: 'token');

    final resp = await http.get('${Environment.apiUrl}/login/renew',
        headers: {'Content-Type': 'application/json', 'x-token': token});

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.user = loginResponse.user;
      await this._savaToken(loginResponse.token);
      return true;
    } else {
      this.logout();
      return false;
    }
  }

  Future _savaToken(String token) async {
    // Write value
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    // Delete value
    await _storage.delete(key: 'token');
  }
}
