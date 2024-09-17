import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz2/fichaArticulo.dart';
import 'package:quiz2/homepage.dart';
import 'package:quiz2/listaArticulos.dart';
import 'package:quiz2/listaArticulosOferta.dart';




class RutasArticulos extends StatefulWidget {
  const RutasArticulos({super.key});

  @override
  State<RutasArticulos> createState() => _RutasArticulosState();
}

class _RutasArticulosState extends State<RutasArticulos> {
  
 @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      initialRoute: '/Homepage', // Define la ruta inicial según el estado del login
      getPages: [
        GetPage(name: '/Articulos', page: () => ListaArticulos()),
        GetPage(name: '/Homepage', page: () => Homepage()),
        //GetPage(name:'/FichaArticulo', page:()=>FichaArticulo()),
        GetPage(name: '/ArticulosOfertas', page:()=> ListaArticulosOfertas()),
      ],
    );
  }

}
