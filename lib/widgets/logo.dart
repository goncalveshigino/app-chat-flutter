import 'package:flutter/material.dart'; 


class Logo extends StatelessWidget {

  final String title;

  const Logo({ @required this.title});

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
            Text(this.title, style: TextStyle(fontSize: 30))
          ],
        ),
      ),
    );
  }
}