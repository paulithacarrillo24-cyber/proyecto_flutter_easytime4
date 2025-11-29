import 'package:flutter/material.dart';
import 'crear_cita_page.dart';
import '../../models/cita.dart';
import '../../models/servicio.dart'; // <-- IMPORTANTE

class CitasPage extends StatefulWidget {
  @override
  State<CitasPage> createState() => _CitasPageState();
}

class _CitasPageState extends State<CitasPage> {
  List<Cita> citas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Citas")),
      body: citas.isEmpty
          ? Center(
              child: Text(
                "No hay citas registradas",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: citas.length,
              itemBuilder: (context, index) {
                final c = citas[index];

                final fecha =
                    "${c.fechaHora.day}/${c.fechaHora.month}/${c.fechaHora.year}";
                final hora =
                    "${c.fechaHora.hour.toString().padLeft(2, '0')}:${c.fechaHora.minute.toString().padLeft(2, '0')}";

                return Card(
                  margin: EdgeInsets.all(12),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.calendar_month, size: 32),
                    title: Text(
                      c.servicio,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("$fecha - $hora"),
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final nuevaCita = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  CrearCitaPage(servicios: servicios), // <-- AQUÍ EL FIX
            ),
          );

          if (nuevaCita != null) {
            setState(() {
              citas.add(nuevaCita);
            });
          }
        },
      ),
    );
  }
}
