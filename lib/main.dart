import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/configuracoes_screen.dart';
import 'screens/pictogramas_screen.dart';
import 'configuracoes_provider.dart';
import 'package:provider/provider.dart';
import 'tema_app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ConfiguracoesProvider(),
      child: const RotinaVisualApp(),
    ),
  );
}

class RotinaVisualApp extends StatelessWidget {
  const RotinaVisualApp({super.key});

  @override
  Widget build(BuildContext context) {
    final configuracoes = context.watch<ConfiguracoesProvider>();
    return MaterialApp(
      title: 'Rotina Visual',
      debugShowCheckedModeBanner: false,
      theme: TemaApp.temaClaro(
        configuracoes.corPrincipal,
      ),
      darkTheme: TemaApp.temaEscuro(
        configuracoes.corPrincipal,
      ),
      themeMode: configuracoes.temaEscuro ? ThemeMode.dark : ThemeMode.light,
      
      home: const HomeScreen(),
      routes: {
        '/configuracoes': (context) => const ConfiguracoesScreen(),
        '/pictogramas': (context) => const PictogramasScreen(),
      },
    );
  }
}