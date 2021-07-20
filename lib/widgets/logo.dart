import 'package:flutter/material.dart'; 


class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: 170,
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Image(image: AssetImage('assets/tag-logo.png')),
            SizedBox(
              height: 25,
            ),
            Text('Messenger', style: TextStyle(fontSize: 30))
          ],
        ),
      ),
    );
  }
}