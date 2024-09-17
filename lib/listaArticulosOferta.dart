import 'package:flutter/material.dart';
import 'package:quiz2/ArticulosService.dart';


class ListaArticulosOfertas extends StatefulWidget {
  const ListaArticulosOfertas({super.key});

  @override
  State<ListaArticulosOfertas> createState() => _ListaArticulosOfertasState();
}

class _ListaArticulosOfertasState extends State<ListaArticulosOfertas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artículos en Oferta'),
      ),
      body: FutureBuilder<List<Widget>>(
        future: ArticulosService.obtenerArticulos(condicion: (item) => item["descuento"] != "0"), // Solo artículos en oferta
        builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView(children: snapshot.data!);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text("No hay artículos en oferta."));
          }
        },
      ),
    );
  }
}
