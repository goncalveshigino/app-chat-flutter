import 'package:flutter/material.dart';

import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/loading_page.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/register_page.dart';
import 'package:chat/pages/user_page.dart';

import 'package:flutter/widgets.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {


  'user'     : (_) => UserPage(),
  'chat'     : (_) => ChatPage(), 
  'login'    : (_) => LoginPage(), 
  'register' : (_) => RegisterPage(), 
  'loading'  : (_) => LoadingPage()

};
