import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/configuracoes_screen.dart';
import 'screens/pictogramas_screen.dart';


void main() {
  runApp(const RotinaVisualApp());
}

class RotinaVisualApp extends StatelessWidget {
  const RotinaVisualApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rotina Visual',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/configuracoes': (context) => const ConfiguracoesScreen(),
        '/pictogramas': (context) => const PictogramasScreen(),
},
    );
    
  }
}