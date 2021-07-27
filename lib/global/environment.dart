
import 'dart:io';

class Environment {

  
  static String  apiURL    = Platform.isAndroid ? 'http://127.0.0.1:3000/api' : 'http://localhost:3000/api';
  static String  socketURL = Platform.isAndroid ? 'http://127.0.0.1:3000'     : 'http://localhost:3000'; 


   
}