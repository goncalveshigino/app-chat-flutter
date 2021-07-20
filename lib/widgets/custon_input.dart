import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  const CustomInput({
 
      @required this.icon, 
      @required this.placeholder, 
      @required this.controller, 
      this.keyborderType = TextInputType.text, 
      this.isPassword = false,
  });



 final IconData icon;
 final String placeholder; 
 final TextEditingController controller;
 final TextInputType keyborderType; 
 final bool isPassword;

  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 5),
                blurRadius: 5),
          ]),
      child: TextField(
        controller: this.controller,
        autocorrect: false,
        obscureText: isPassword,
        keyboardType: this.keyborderType,
        decoration: InputDecoration(
            prefixIcon: Icon( this.icon),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: this.placeholder),
      ),
    );
  }
}
