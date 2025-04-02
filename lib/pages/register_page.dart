
import 'package:flutter/material.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/pages/principal_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Text(
                      'Registre-se',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Digite seu email, senha e confirme para continuar!',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              Container(margin: EdgeInsets.only(bottom: 80)),

              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(color: Colors.black, Icons.person),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Digite seu e-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextField(
                  controller: senhaController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    prefixIcon: Icon(color: Colors.black, Icons.lock),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Digite sua senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    suffixIcon: IconButton(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextField(
                  controller: confirmarSenhaController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    prefixIcon: Icon(color: Colors.black, Icons.lock),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Confirme sua senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    suffixIcon: IconButton(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  onPressed: () {
                    String email = emailController.text;
                    String senha = senhaController.text;
                    String confirmarSenha = confirmarSenhaController.text;

                    if (email.isEmpty || senha.isEmpty || confirmarSenha.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Erro'),
                            content: const Text('Preencha todos os campos!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else if (senha != confirmarSenha) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Erro'),
                            content: const Text('Senhas diferentes!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrincipalPage(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Registrar',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Já tem conta? Entre',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}