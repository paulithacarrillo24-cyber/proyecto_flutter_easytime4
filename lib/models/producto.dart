import 'package:flutter/material.dart';

class Producto {
  final String nombre;
  final double precio;
  final String categoria; // Ej: Motor, Accesorio, Limpieza, Moto, Carro
  final IconData icono;
  int ventas; // Nuevo campo

  Producto({
    required this.nombre,
    required this.precio,
    required this.categoria,
    required this.icono,
    this.ventas = 0, // Valor por defecto
  });
}

// Lista de productos inicial (CORREGIDA, AMPLIADA Y CON CONTADOR)
final List<Producto> productos = [
  Producto(
    nombre: "Aceite para motor 20W50",
    precio: 35000,
    categoria: "Motor - Carro",
    icono: Icons.build,
    ventas: 12,
  ),
  Producto(
    nombre: "Bujía NGK",
    precio: 15000,
    categoria: "Motor - Moto",
    icono: Icons.electric_bolt,
    ventas: 7,
  ),
  Producto(
    nombre: "Shampoo para autos",
    precio: 12000,
    categoria: "Limpieza",
    icono: Icons.water_drop,
    ventas: 3,
  ),
  Producto(
    nombre: "Cadena reforzada moto",
    precio: 45000,
    categoria: "Moto",
    icono: Icons.settings,
    ventas: 5,
  ),
  Producto(
    nombre: "Juego de llantas carro",
    precio: 900000,
    categoria: "Carro",
    icono: Icons.circle,
    ventas: 1,
  ),
  Producto(
    nombre: "Casco para moto",
    precio: 120000,
    categoria: "Accesorio",
    icono: Icons.sports_motorsports,
    ventas: 9,
  ),

  // 🔥 Productos adicionales
  Producto(
    nombre: "Filtro de aire carro",
    precio: 28000,
    categoria: "Motor - Carro",
    icono: Icons.air,
    ventas: 4,
  ),
  Producto(
    nombre: "Filtro de aceite moto",
    precio: 18000,
    categoria: "Motor - Moto",
    icono: Icons.filter_alt,
    ventas: 6,
  ),
  Producto(
    nombre: "Guantes de protección",
    precio: 35000,
    categoria: "Accesorio",
    icono: Icons.handshake,
    ventas: 2,
  ),
  Producto(
    nombre: "Coolant Refrigerante",
    precio: 25000,
    categoria: "Motor",
    icono: Icons.ac_unit,
    ventas: 3,
  ),
  Producto(
    nombre: "Pulidor de pintura",
    precio: 22000,
    categoria: "Limpieza",
    icono: Icons.brush,
    ventas: 1,
  ),
  Producto(
    nombre: "Pastillas de freno carro",
    precio: 85000,
    categoria: "Carro",
    icono: Icons.car_repair,
    ventas: 8,
  ),
  Producto(
    nombre: "Espejo retrovisor moto",
    precio: 30000,
    categoria: "Moto",
    icono: Icons.remove_red_eye,
    ventas: 5,
  ),
  Producto(
    nombre: "Bombillo LED H4",
    precio: 40000,
    categoria: "Accesorio",
    icono: Icons.light_mode,
    ventas: 11,
  ),
  Producto(
    nombre: "Kit de herramientas básico",
    precio: 55000,
    categoria: "Accesorio",
    icono: Icons.home_repair_service,
    ventas: 3,
  ),
  Producto(
    nombre: "Líquido de frenos DOT 4",
    precio: 15000,
    categoria: "Motor",
    icono: Icons.local_gas_station,
    ventas: 4,
  ),
  Producto(
    nombre: "Protector de asiento moto",
    precio: 18000,
    categoria: "Moto",
    icono: Icons.event_seat,
    ventas: 6,
  ),
  Producto(
    nombre: "Limpiavidrios",
    precio: 10000,
    categoria: "Limpieza",
    icono: Icons.cleaning_services,
    ventas: 2,
  ),
  Producto(
    nombre: "Tapetes de carro (juego)",
    precio: 70000,
    categoria: "Carro",
    icono: Icons.square,
    ventas: 3,
  ),
  Producto(
    nombre: "Farola delantera moto",
    precio: 60000,
    categoria: "Moto",
    icono: Icons.flashlight_on,
    ventas: 5,
  ),
  Producto(
    nombre: "Cable USB para cargador de carro",
    precio: 15000,
    categoria: "Accesorio",
    icono: Icons.usb,
    ventas: 7,
  ),
];
