// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  final ScrollController _scrollController = ScrollController();

  final List<int> _listaNumeros = [
    1020,
    1024,
    1025,
    1063,
    1069,
    1074,
    1076,
    1080,
    1077,
    111,
    110,
    1084,
    169
  ];

  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  //Cuando inicia la aplicacion agrego 10
  void initState() {
    super.initState();
    //_agregar10();

    //Cuando llego al final de la página agrego 10
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_agregar10();
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Listas')),
        body: Stack(
          children: <Widget>[_crearLista(), _crearLoading()],
        ));
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
              placeholder: const AssetImage('assets/jar-loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300?image=$imagen'),
              fadeInDuration: const Duration(milliseconds: 200),
              height: 300.0,
              fit: BoxFit.cover);
        },
      ),
    );
  }

  Future obtenerPagina1() async {
    const duration = Duration(seconds: 2);
    Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10() {
    setState(() {
      for (var i = 1; i < 10; i++) {
        _ultimoItem++;
        _listaNumeros.add(_ultimoItem);
      }
    });
  }

//Simular peticion a api que demora 1 segundo
  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = Duration(seconds: 1);
    return Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 250));
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CircularProgressIndicator()]),
          //Tambien se podria agregar un padding para la separacion
          const SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
