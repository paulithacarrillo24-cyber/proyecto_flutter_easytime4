import 'package:flutter/material.dart';
import '../../models/cita.dart';
import '../../models/servicio.dart';

class CrearCitaPage extends StatefulWidget {
  final List<Servicio> servicios;

  CrearCitaPage({required this.servicios});

  @override
  State<CrearCitaPage> createState() => _CrearCitaPageState();
}

class _CrearCitaPageState extends State<CrearCitaPage> {
  Servicio? servicioSeleccionado;
  DateTime? fechaSeleccionada;
  TimeOfDay? horaSeleccionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crear Cita")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// ---------------------------
            ///  Servicio
            /// ---------------------------
            DropdownButtonFormField<Servicio>(
              decoration: InputDecoration(labelText: "Servicio"),
              items: widget.servicios.map((s) {
                return DropdownMenuItem(
                  value: s,
                  child: Row(
                    children: [
                      Icon(s.icono),
                      SizedBox(width: 10),
                      Text("${s.nombre} - \$${s.precio} - ${s.duracion} min"),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) =>
                  setState(() => servicioSeleccionado = value),
            ),

            SizedBox(height: 20),

            /// ---------------------------
            ///  Fecha
            /// ---------------------------
            ListTile(
              title: Text(
                fechaSeleccionada == null
                    ? "Seleccionar fecha"
                    : fechaSeleccionada.toString().split(" ")[0],
              ),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                final fecha = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );
                if (fecha != null) {
                  setState(() => fechaSeleccionada = fecha);
                }
              },
            ),

            /// ---------------------------
            ///  Hora
            /// ---------------------------
            ListTile(
              title: Text(
                horaSeleccionada == null
                    ? "Seleccionar hora"
                    : horaSeleccionada!.format(context),
              ),
              trailing: Icon(Icons.access_time),
              onTap: () async {
                final hora = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (hora != null) {
                  setState(() => horaSeleccionada = hora);
                }
              },
            ),

            SizedBox(height: 30),

            /// ---------------------------
            ///  Guardar Cita
            /// ---------------------------
            ElevatedButton(
              child: Text("Guardar Cita"),
              onPressed: () {
                if (servicioSeleccionado != null &&
                    fechaSeleccionada != null &&
                    horaSeleccionada != null) {
                  final fechaHora = DateTime(
                    fechaSeleccionada!.year,
                    fechaSeleccionada!.month,
                    fechaSeleccionada!.day,
                    horaSeleccionada!.hour,
                    horaSeleccionada!.minute,
                  );

                  Navigator.pop(
                    context,
                    Cita(
                      servicio: servicioSeleccionado!.nombre,
                      fechaHora: fechaHora,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
