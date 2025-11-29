import 'package:flutter/material.dart';

import '../../screens/citas/cita_page.dart';
import '../../screens/servicios/servicios_page.dart';
import '../../screens/productos/productos_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EasyTime',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EasyTime")),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // 🔥 LOGO DE LA EMPRESA
          Center(child: Image.asset("assets/images/logo.png", height: 150)),
          SizedBox(height: 30),

          _buildCard(
            title: "Citas",
            icon: Icons.calendar_month,
            color: Colors.blue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CitasPage()),
              );
            },
          ),
          SizedBox(height: 20),

          _buildCard(
            title: "Servicios",
            icon: Icons.cleaning_services,
            color: Colors.green,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ServiciosPage()),
              );
            },
          ),
          SizedBox(height: 20),

          _buildCard(
            title: "Productos",
            icon: Icons.shopping_bag,
            color: Colors.orange,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProductosPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: color.withOpacity(0.2),
                child: Icon(icon, size: 35, color: color),
              ),
              SizedBox(width: 20),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
