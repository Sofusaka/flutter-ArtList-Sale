

import 'package:flutter/material.dart';

class FichaArticulo extends StatelessWidget {
  final String img;
  final String nombre;
  final String carrera;
  final String colegio;
  final String edad;
  final String universidad;
  
  const FichaArticulo(
      {required this.carrera,
      required this.colegio,
      required this.img,
      required this.nombre,
      super.key, required this.edad, required this.universidad});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de usuario'),
      ),
      body: Center(
        child: Column(children: [
          Image(
              image: NetworkImage(img),
              height: 100,
              width: 100,
            ),

           Text('Nombres y apellidos: $nombre'),
           Text('Profesión: $carrera'),
            Text('Edad: $edad'),
            Text('Universidad: $universidad'),
             Text('Universidad: $colegio'),
          ElevatedButton(
          child: const Text('Regresar'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        
        ]
      ),
    )));
  }
}