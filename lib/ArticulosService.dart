import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz2/itemArticulo.dart';

class ArticulosService {
  static const String sUrl = "https://api.npoint.io/237a0d1ac8530064cc04";

  // Esta función retorna un booleano y pregunta si el map (articulo) cumple con la condición
  //A la función se le pasa un map y retorna un booleano
  //El metodo recibe una función que recibe un map y retorna un booleano. Para usarla, se le debe pasar una función (condicion)
  static Future<List<Widget>> obtenerArticulos({required bool Function(Map<String, dynamic>) condicion}) async {
    try {
      final oRespuesta = await http.get(
        Uri.parse(sUrl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      dynamic oJsonDatos = jsonDecode(utf8.decode(oRespuesta.bodyBytes));
      List items = oJsonDatos["articulos"];
      List<Widget> awItems = [];

      for (var item in items) {
        // Aqui se pregunta si el item cumple con la condición
        if (condicion(item)) {
          awItems.add(ProductoSingle(
            isOferta: item["descuento"] != "0",
            descuento: item["descuento"].toString(),
            valoracion: int.parse(item["valoracion"]),
            descripcion: item["descripcion"].toString(),
            calificacion: item["calificaciones"].toString(),
            precio: int.parse(item["precio"]),
            img: item["urlimagen"].toString(),
            nombre: item["articulo"].toString(),
          ));
        }
      }

      return awItems;
    } catch (e) {
      print("ERROR AL ENVIAR/RECIBIR SOLICITUD:");
      print(e);
      return [];
    }
  }
}
