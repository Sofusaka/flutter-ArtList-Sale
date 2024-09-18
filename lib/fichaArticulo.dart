import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FichaArticulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recibimos los parámetros desde Get.arguments
    final Map<String, dynamic> args = Get.arguments;

    final String img = args['img'];
    final String nombre = args['nombre'];
    final String calificacion = args['calificacion'];
    final int precio = args['precio'];
    final String descripcion = args['descripcion'];
    final int valoracion = args['valoracion'];
    final String descuento = args['descuento'];
    final bool isOferta = args['isOferta'];
    final double valoracionfinal = args['valoracionfinal'];
    final double ?fprecio = args['fprecio'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del Artículo'),
      ),
      body: Center(
        child: Column(children: [
          Image(
            image: NetworkImage(img),
            height: 300,
            width: 300,
          ),
          Text(nombre),

          if (isOferta)
          Column(
            children: [
              
              Text(
                "ANTES: \$${precio}",
                style: TextStyle(fontSize: 15),
              ),
              Text("AHORA: \$$fprecio",
              
              style:  TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              
                Text(
                  "Oferta: ${descuento}%",
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 175, 91),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
            ],
          )
          else


          Column(
            children: [
              Text(
                "Precio: \$${precio}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Column(children: [Text(
              style: const TextStyle(fontSize: 25),
              
              
              valoracionfinal.toString())]),
            Column(children: [
              Row(children: [
                estrellas(valoracionfinal)]),
              Row(children: [
                Text("calificaciones: $calificacion")
                ,
                
              ]),
              
            ]),
            
        ]),
          
          
          ElevatedButton(
            child: const Text('Regresar'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]),
      ),
    );
  }

  Widget estrellas(double valoracionfinal) {
    return RatingBarIndicator(
      rating: valoracionfinal,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 25.0,
    );
  }
}
