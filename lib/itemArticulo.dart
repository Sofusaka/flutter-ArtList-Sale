
import 'dart:ffi';
// Removed the conflicting import

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:quiz2/fichaArticulo.dart';



class ProductoSingle extends StatefulWidget {
  final String img;
  final String nombre;
  final String calificacion;
  final int precio;
  final String descripcion;
  final int valoracion; 
  final String descuento;
  final bool isOferta;

  const ProductoSingle({
    required this.calificacion,
    required this.img,
    required this.nombre,
    required this.precio,
    required this.descripcion,
    required this.valoracion,
    required this.descuento,
    required this.isOferta,
    super.key,
  });



  @override
  _ProductoSingleState createState() => _ProductoSingleState();
}

class _ProductoSingleState extends State<ProductoSingle> {
  double valoracionfinal = 0;
   late String sDescuento; 
   late double fDescuento;
   late double fprecio;
  
  @override
  void initState() {
    super.initState();
    valoracionfinal = widget.valoracion / 10;
     sDescuento=widget.descuento.split("%")[0];
     fDescuento = (100-int.parse(sDescuento))/100;
     fprecio=widget.precio*fDescuento;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      child: widget.isOferta ? _buildOferta() : _buildArticulo(),
    );
  }

  
Widget _buildOferta() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          child: Image(
            image: NetworkImage(widget.img),
            height: 66, // Tamaño para vista lista
            width: 66,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('EN OFERTA'),
              Text(widget.nombre),
              Row(children: [
                Text( "\$${widget.precio*fDescuento}"),
                Text(style: const TextStyle(
                        color: Colors.green 
                      ),                  
                   "  ${widget.descuento}% OFF!!"),
              ],),
               RatingBarIndicator(
                    rating: valoracionfinal,
                    itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 25.0,
                    
                ),
                
                ElevatedButton(
                  onPressed: () => Get.toNamed('/FichaArticulo', arguments: {
                    'img': widget.img,
                    'nombre': widget.nombre,
                    'precio': widget.precio,
                    'calificacion': widget.calificacion,
                    'valoracion': widget.valoracion,
                    'descripcion': widget.descripcion,
                    'descuento': widget.descuento,
                    'isOferta': widget.isOferta,
                    'valoracionfinal': valoracionfinal,
                    'fprecio': fprecio,
                  }),
                  child: Text('ver mas'),
                )
            ],
          ),
        ),
        
      ],
    );
  }

  Widget _buildArticulo() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          child: Image(
            image: NetworkImage(widget.img),
            height: 66, // Tamaño para vista lista
            width: 66,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.nombre),
              Text(style: const TextStyle(
                        fontWeight: FontWeight.bold, 
                      ),
                                    
                "\$${widget.precio}"),
                estrellas(valoracionfinal),
                ElevatedButton(
                  onPressed: () => Get.toNamed('/FichaArticulo', arguments: {
                    'img': widget.img,
                    'nombre': widget.nombre,
                    'precio': widget.precio,
                    'calificacion': widget.calificacion,
                    'valoracion': widget.valoracion,
                    'descripcion': widget.descripcion,
                    'descuento': widget.descuento,
                    'isOferta': widget.isOferta,
                    'valoracionfinal': valoracionfinal,
                  }),
                  child: Text('ver mas'),
                )
              
              
            ],
          ),
        ),
        
      ],
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

