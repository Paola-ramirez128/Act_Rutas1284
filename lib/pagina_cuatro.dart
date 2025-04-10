import 'package:flutter/material.dart';

class PantallaCuatro extends StatefulWidget {
  const PantallaCuatro({Key? key}) : super(key: key);

  @override
  State<PantallaCuatro> createState() => _PantallaCuatroState();
}

class _PantallaCuatroState extends State<PantallaCuatro> {
  double _paddingValue = 0.0;
  bool _isExpanded = false;

  void _togglePadding() {
    setState(() {
      _paddingValue = _isExpanded ? 0.0 : 100.0;
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final containerWidth = screenSize.width * 0.9;
    final containerHeight = screenSize.height / 4;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pantalla Cuatro",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff9bd2ec),
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: SingleChildScrollView(
          // Para asegurar que todo sea visible en pantallas pequeñas
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: _togglePadding,
                child: Text(
                  _isExpanded ? 'Reducir Padding' : 'Aumentar Padding',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Padding actual: ${_paddingValue.round()}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 32),
              AnimatedPadding(
                padding: EdgeInsets.all(_paddingValue),
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40), // Espacio antes del botón de regreso
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xff9bd2ec), // Coincide con el AppBar
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Regresar",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20), // Espacio final
            ],
          ),
        ),
      ),
    );
  }
}
