import 'package:flutter/material.dart';
import 'package:proyecto/models/servicio.dart';

class ServiciosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Servicios")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: servicios.length,
        itemBuilder: (context, index) {
          final s = servicios[index];

          return Card(
            elevation: 3,
            margin: EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Icon(s.icono, size: 35, color: Colors.blueAccent),
              title: Text(
                s.nombre,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Precio: \$${s.precio}   ·   Duración: ${s.duracion} min",
              ),
            ),
          );
        },
      ),
    );
  }
}
