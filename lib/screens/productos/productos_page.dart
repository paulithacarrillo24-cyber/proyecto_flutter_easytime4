import 'package:flutter/material.dart';
import '../../models/producto.dart';

class ProductosPage extends StatefulWidget {
  @override
  State<ProductosPage> createState() => _ProductosPageState();
}

class _ProductosPageState extends State<ProductosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Productos")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final p = productos[index];

          return Card(
            elevation: 3,
            margin: EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Icon(p.icono, size: 35, color: Colors.orange),

              title: Text(
                p.nombre,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              subtitle: Text(
                "Categoría: ${p.categoria}\nPrecio: \$${p.precio.toInt()}",
              ),

              // 🔥 Contador de ventas con ícono de carrito
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart, color: Colors.green, size: 22),
                  SizedBox(height: 4),
                  Text(
                    p.ventas.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),

              // 🔥 Al tocar el producto, aumentar ventas
              onTap: () {
                setState(() {
                  p.ventas++;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${p.nombre} vendido (${p.ventas})"),
                    duration: Duration(milliseconds: 700),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
