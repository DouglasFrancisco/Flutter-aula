import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:myapp/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;

  int _gerarNumeroAleatorio(){
    math.Random numeroAleatorio = math.Random();
    return numeroAleatorio.nextInt (1000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu APP"),
      ),
    body: Center(child: Text(numeroGerado.toString())),
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.add_a_photo),
      onPressed: ( ) {
        setState(() {
          numeroGerado = _gerarNumeroAleatorio();
        });
        print(numeroGerado);
      },
    ),
    );
  }
}