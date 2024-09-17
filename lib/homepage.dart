import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Homepage'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/Articulos');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.shopping_bag),
                    SizedBox(width: 8), // Espacio entre el icono y el texto
                    Text('Ver lista de artículos'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/ArticulosOfertas');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.money_off_rounded),
                    SizedBox(width: 8), // Espacio entre el icono y el texto
                    Text('Ver lista de artículos en oferta'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
