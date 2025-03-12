import 'package:flutter/material.dart';
import 'package:myapp/pages/principal_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: const Icon(Icons.person, size: 100, color: Colors.white),
              ),
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
              const SizedBox(height: 20),
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
                    String fixedEmail = 'teste@gmail.com';
                    String fixedSenha = '123';

                    String email = emailController.text;
                    String senha = senhaController.text;

                    if (email.isEmpty || senha.isEmpty) {
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
                    }

                    if (email == fixedEmail && senha == fixedSenha) {
                      Navigator.pushReplacement(
                        context,
                          MaterialPageRoute(
                            builder: (context) => const PrincipalPage(),
                          ),
                      );
                    } else if (email != fixedEmail || senha != fixedSenha) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Erro'),
                            content: const Text('E-mail ou senha incorretos!'),
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
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 18),
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
