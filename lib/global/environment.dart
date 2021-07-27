
import 'dart:io';

class Environment {

  
  static String  apiURL    = Platform.isAndroid ? 'http://192.168.43.42:3000/api' : 'http://localhost:3000/api';
  static String  socketURL = Platform.isAndroid ? 'http://192.168.43.42:3000'     : 'http://localhost:3000'; 


   
}