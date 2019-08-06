import 'package:flutter/material.dart';
import 'package:youtube_clone/telas/Biblioteca.dart';
import 'package:youtube_clone/telas/EmAlta.dart';
import 'package:youtube_clone/telas/Inicio.dart';
import 'package:youtube_clone/telas/Inscricoes.dart';
import 'Home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/incio' : (context) => Inicio(),
    '/EmAlta' : (context) => EmAlta(),
    '/Inscricoes' : (context) => Inscricoes(),
    '/Biblioteca' : (context) => Biblioteca(),
  },
  home: Home(),
));

