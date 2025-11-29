import 'package:flutter/material.dart';

class Servicio {
  final String nombre;
  final int precio;
  final int duracion;
  final IconData icono;

  Servicio({
    required this.nombre,
    required this.precio,
    required this.duracion,
    required this.icono,
  });
}

final List<Servicio> servicios = [
  Servicio(
    nombre: "Lavado básico",
    precio: 10000,
    duracion: 30,
    icono: Icons.water_drop,
  ),
  Servicio(
    nombre: "Lavado profundo",
    precio: 15000,
    duracion: 45,
    icono: Icons.cleaning_services,
  ),
  Servicio(
    nombre: "Lavado premium",
    precio: 20000,
    duracion: 60,
    icono: Icons.star,
  ),
];
