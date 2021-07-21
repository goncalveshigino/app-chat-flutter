import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {

  const Bottom({ @required this.text, @required this.color, @required this.onPressed });

  final String text; 
  final Function onPressed;
  final Color color;
  

  @override
  Widget build(BuildContext context) {
    return RaisedButton(

      elevation: 2,
      highlightElevation: 5, 
      color: color, 
      shape: StadiumBorder(),

     child:Container(
        width: double.infinity,
        height: 50, 
        child: Center(
          child: Text( text, style: TextStyle( color: Colors.white, fontSize: 17))
      ),
    ), 

    onPressed: onPressed,
    );
  }
}
