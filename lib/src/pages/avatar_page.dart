// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Avatar Page'), actions: <Widget>[
          Container(
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://es.web.img3.acsta.net/r_654_368/newsv7/20/12/23/10/22/3624739.jpg')),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0, left: 10.0),
            child:
                CircleAvatar(child: Text('LM'), backgroundColor: Colors.green),
          ),
        ]),
        body: Center(
            child: FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                fadeInDuration: Duration(milliseconds: 200),
                height: 350.0,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://media.revistagq.com/photos/5ca5eff30a5ae669292a32e2/master/pass/batman_80_aniversario_3726.png'))));
  }
}
