import 'dart:io';

import 'package:chat/widgets/chat_massenger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';  

class ChatPage extends StatefulWidget {
 

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {


 final _textController =  TextEditingController();
 final _focusNode = FocusNode(); 

 List<ChatMessanger> _messanges = [
  //  ChatMessanger( uid: '123', texto: 'Ola Mundo'),
  //  ChatMessanger( uid: '13', texto: 'Ola Mundo'), 
  //  ChatMessanger( uid: '123', texto: 'Ola Mundo'), 
  //  ChatMessanger( uid: '13', texto: 'Ola Mundo'),
  //  ChatMessanger( uid: '13', texto: 'Ola Mundo'),
 ];

 bool _writing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              child: Text('Go', style: TextStyle( fontSize: 12)),
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
            ), 
            SizedBox(height: 3,), 
            Text('Goncalves Higino', style: TextStyle( color: Colors.black87, fontSize: 15))
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ), 
      body: Container(
        child: Column(
          children: [

            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messanges.length,
                itemBuilder: (_, i) => _messanges[i],
                reverse: true,
              ),
            ), 

             Divider(height: 1,), 

             // TODO:Caixa de texto
             Container(
               color: Colors.white, 
               child: _inputChat(),
             )

          ],
        ),
      )
    );
  }

  Widget _inputChat(){

    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [

            Flexible(
              child: TextField(
                controller: _textController,
                 onSubmitted: _handleSubmit,
                 onChanged: ( String texto){
                   setState(() {
                      if( texto.trim().length > 0) {
                        _writing = true;
                      } else {
                        _writing = false;
                      }  
                   });
                 },
                 decoration: InputDecoration.collapsed(
                   hintText: 'Enviar mensagem'
                 ),
                 focusNode: _focusNode,
              ),
            ),

            //Botao para enviar 

            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0 ),
              child: Platform.isAndroid
              ? Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0), 
                child: IconTheme(
                  data: IconThemeData( color: Colors.blue[400] ),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon( Icons.send, ),
                    onPressed: _writing ? () => _handleSubmit( _textController.text.trim() ) : null,
                  ),
                ),
              )
              
              : CupertinoButton(
                child: Text('Enviar'), 
                onPressed:  _writing ? () => _handleSubmit( _textController.text.trim() ) : null,
              )
            )
          
          ],
        ),
      ),
    );

  }

 _handleSubmit( String texto){

   if( texto.length == 0 ) return ;

    print( texto );
     _textController.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessanger(
       uid: '123',
       texto: texto, 
       animationController: AnimationController(vsync: this, duration: Duration( milliseconds: 400)),
    );
    _messanges.insert(0, newMessage);
    newMessage.animationController.forward();

     setState(() {
        _writing = false;
     });

   
 }

}