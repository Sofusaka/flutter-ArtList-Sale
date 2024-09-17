 // ignore_for_file: avoid_print


import 'package:flutter/material.dart';
import 'package:quiz2/ArticulosService.dart';


class ListaArticulos extends StatefulWidget {
  const ListaArticulos({super.key});

  @override
  State<ListaArticulos> createState() => _ListaArticulosState();
}

class _ListaArticulosState extends State<ListaArticulos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos los Artículos'),
      ),
      body: FutureBuilder<List<Widget>>(
        future: ArticulosService.obtenerArticulos(condicion: (item) => true), // Mostrar todos los artículos
        builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView(children: snapshot.data!);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text("No hay datos disponibles."));
          }
        },
      ),
    );
  }
}
