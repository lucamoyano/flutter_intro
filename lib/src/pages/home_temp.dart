import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Componentes Temp')),
        body: ListView(children: _crearItemsCorta()));
  }

  // ignore: unused_element
  List<Widget> _crearItems() {
    List<Widget> lista = <Widget>[];

    for (String opt in opciones) {
      final tempWidget = ListTile(title: Text(opt));
      lista.add(tempWidget);
      lista.add(const Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item),
            subtitle: const Text('Subtitulo'),
            leading: const Icon(Icons.ac_unit_outlined),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          const Divider()
        ],
      );
    }).toList();
  }
}
