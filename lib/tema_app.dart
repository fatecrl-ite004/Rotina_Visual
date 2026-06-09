import 'package:flutter/material.dart';

//cores salvas em variaveis, caso precise mudar todas de uma vez
class Cores {
  static const Color azulTemaClaro = Color.fromRGBO(125, 188, 239, 1);
  static const Color azulTemaEscuro = Color.fromRGBO(48, 58, 68, 1);

  static const Color branco = Color.fromRGBO(235, 235, 235, 1);
  static const Color preto = Color.fromRGBO(4, 4, 4, 1);
}

class TemaApp {
  //tema claro
  static ThemeData temaClaro(Color corPrincipal) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      primaryColor: corPrincipal,

      scaffoldBackgroundColor: Cores.branco,

      appBarTheme: AppBarTheme(
        backgroundColor: corPrincipal,
        foregroundColor: Cores.branco,
        elevation: 4,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      drawerTheme: const DrawerThemeData(
        backgroundColor: Cores.branco,
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: corPrincipal,
        foregroundColor: Cores.branco,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Cores.branco,
        selectedItemColor: corPrincipal,
        unselectedItemColor: Colors.grey,
      ),

      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Colors.grey,
        contentTextStyle: TextStyle(
          color: Cores.preto,
        ),
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStatePropertyAll(
          corPrincipal,
        ),
      ),

      cardTheme: const CardThemeData(
        elevation: 2,
      ),
    );
  }

  //tema escuro
  static ThemeData temaEscuro(Color corPrincipal) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      primaryColor: corPrincipal,

      scaffoldBackgroundColor: Cores.preto,

      appBarTheme: AppBarTheme(
        backgroundColor: corPrincipal,
        foregroundColor: Cores.branco,
        elevation: 4,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      drawerTheme: const DrawerThemeData(
        backgroundColor: Cores.preto,
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: corPrincipal,
        foregroundColor: Cores.branco,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Cores.preto,
        selectedItemColor: corPrincipal,
        unselectedItemColor: Colors.grey,
      ),

      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Colors.grey,
        contentTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStatePropertyAll(
          corPrincipal,
        ),
      ),

      cardTheme: const CardThemeData(
        elevation: 2,
      ),
    );
  }
}