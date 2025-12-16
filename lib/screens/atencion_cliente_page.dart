import 'package:flutter/material.dart';

class AtencionClientePage extends StatefulWidget {
  @override
  _AtencionClientePageState createState() => _AtencionClientePageState();
}

class _AtencionClientePageState extends State<AtencionClientePage> {
  final TextEditingController _mensajeController = TextEditingController();

  // Lista dinámica de contactos de soporte
  final List<Map<String, String>> contactos = [
    {"tipo": "Teléfono", "dato": "+57 300 123 4567"},
    {"tipo": "Correo", "dato": "soporte@easytime.com"},
    {"tipo": "WhatsApp", "dato": "+57 300 987 6543"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Atención al Cliente")),
      body: Column(
        children: [
          // 🔹 Expanded con ListView.builder (lista dinámica de contactos)
          Expanded(
            child: ListView.builder(
              itemCount: contactos.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        contactos[index]["tipo"] == "Teléfono"
                            ? Icons.phone
                            : contactos[index]["tipo"] == "Correo"
                            ? Icons.email
                            : Icons.chat,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              contactos[index]["tipo"]!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              contactos[index]["dato"]!,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // 🔹 TextField con TextEditingController (entrada de mensaje)
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              border: Border(top: BorderSide(color: Colors.grey.shade400)),
            ),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _mensajeController,
                    decoration: InputDecoration(
                      hintText: "Escribe tu consulta...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_mensajeController.text.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Mensaje enviado: ${_mensajeController.text}",
                          ),
                        ),
                      );
                      _mensajeController.clear();
                    }
                  },
                  child: Text("Enviar"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
