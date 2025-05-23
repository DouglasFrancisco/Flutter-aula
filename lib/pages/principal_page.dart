import 'package:flutter/material.dart';
import 'package:myapp/pages/dadosCadastrais_page.dart';
import 'login_page.dart';
import 'termosPrivacidade_page.dart';
import 'inicial_page.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina Principal')),
      
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TermosPrivacidadePage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(Icons.privacy_tip),
                      SizedBox(width: 10),
                      Text("Termos de uso e privacidade"),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DadosCadastraisPage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(Icons.bar_chart),
                      SizedBox(width: 10),
                      Text('Dados cadastrais'),
                    ],
                  ),
                ),
              ),

              Spacer(),

              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => InicialPage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(width: 10),
                      Text('Logout'),
                    ],
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
