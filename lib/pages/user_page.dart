import 'package:chat/models/user.dart';
import 'package:flutter/material.dart';  

class UserPage extends StatefulWidget {
 

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> { 


  final users = [
    User( uid: '1', name: 'Higino', email: 'higino@gmail.com', online: true),
    User(uid: '2', name: 'Gonçalves', email: 'goncalves@gmail.com', online: false),
    User( uid: '3', name: 'Lidia',   email: 'lidia@gmail.com', online: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Nome', style: TextStyle( color: Colors.black87)),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon( Icons.exit_to_app, color: Colors.black87), 
          onPressed: (){},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only( right: 10), 
            child: Icon( Icons.check_circle, color: Colors.blue[400] ),
           // child: Icon( Icons.offline_bolt, color: Colors.red[400] ),
          )
        ],
      ),
       body: ListView.separated(
         physics: BouncingScrollPhysics(),
         itemCount: users.length,
         itemBuilder: (_, i) => _userListTile(users[i]), 
         separatorBuilder: (_, i) => Divider(), 

       )
    );
  }

  _userListTile(User user) {
    return ListTile(
         title: Text(user.name),
         subtitle: Text(user.email),
         leading: CircleAvatar(
           child: Text( user.name.substring(0, 2)),
           backgroundColor: Colors.blue[100],
         ),
         trailing: Container(
           width: 10,
           height: 10, 
           decoration: BoxDecoration(
             color: user.online ? Colors.green[300] : Colors.red, 
             borderRadius: BorderRadius.circular(100)
           ),
         ),
       );
  }
}