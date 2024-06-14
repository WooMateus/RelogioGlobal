import 'package:flutter/material.dart';
import 'package:relogioglobal/./pages/home.dart';
import 'package:relogioglobal/./pages/escolher_local.dart';
import 'package:relogioglobal/./pages/pagina_carregando.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Carregar(),
        '/home': (context) => Home(),
        '/localizacao': (context) => EscolherLocal(),
      },
    ));
