// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  final ButtonStyle style = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.blue),
      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 17)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Alert Page')),
        body: Center(
            child: ElevatedButton(
          child: Text('Mostrar Alerta'),
          style: style,
          onPressed: () => _mostrarAlert(context),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.add_location),
        ));
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              title: Text('Titulo'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text('Contenido'), FlutterLogo(size: 100.0)],
              ),
              actions: <Widget>[
                TextButton(
                    child: Text('Cancelar'),
                    onPressed: () => Navigator.of(context).pop()),
                TextButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ]);
        });
  }
}
