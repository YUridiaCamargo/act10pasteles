import 'package:flutter/material.dart';

void main() => runApp(const PasteleriaApp());

class PasteleriaApp extends StatelessWidget {
  const PasteleriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CatalogoPasteles(),
    );
  }
}

class CatalogoPasteles extends StatelessWidget {
  const CatalogoPasteles({super.key});

  final List<Map<String, String>> pasteles = const [
    {'nombre': 'red velvet', 'url': 'https://raw.githubusercontent.com/YUridiaCamargo/imagenesp/refs/heads/main/tarta-red-velvet.jpg'},
    {'nombre': 'chocolate', 'url': 'https://raw.githubusercontent.com/YUridiaCamargo/imagenesp/refs/heads/main/choccoo.jpg'}, // Imagen actualizada
    {'nombre': 'confeti', 'url': 'https://raw.githubusercontent.com/YUridiaCamargo/imagenesp/refs/heads/main/PASTELCONFETI%20(1).jpg'},
    {'nombre': 'vainilla', 'url': 'https://raw.githubusercontent.com/YUridiaCamargo/imagenesp/refs/heads/main/vainilla.jpg'},
    {'nombre': 'nutella', 'url': 'https://raw.githubusercontent.com/YUridiaCamargo/imagenesp/refs/heads/main/Pastelnutella1.png'},
    {'nombre': 'fresa', 'url': 'https://raw.githubusercontent.com/YUridiaCamargo/imagenesp/refs/heads/main/pastelfresa.png'},
    {'nombre': 'cajeta', 'url': 'https://raw.githubusercontent.com/YUridiaCamargo/imagenesp/refs/heads/main/autentico-de-cajeta.jpg'},
    {'nombre': 'ferrero', 'url': 'https://raw.githubusercontent.com/YUridiaCamargo/imagenesp/refs/heads/main/ferrero.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBE6D3),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color(0xFF5D1711),
        title: const Text(
          'Pasteles',
          style: TextStyle(
            color: Colors.white, 
            fontFamily: 'Cursive',
            fontSize: 32,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () {}, // Botón de acción
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Más margen lateral para achicar cuadros
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.9, // Ajuste para que el container sea más cuadrado y chico
        ),
        itemCount: pasteles.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFA64D36),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Imagen más grande y proporcional
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    pasteles[index]['url']!,
                    height: 85, // Altura incrementada
                    width: 110, // Ancho incrementado
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  pasteles[index]['nombre']!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                // Botón de acción "ordenar"
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'ordenar',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}