import 'package:flutter/material.dart';
import 'package:myapp/pages/inicial_page.dart';
import 'package:myapp/pages/principal_page.dart';
import 'login_page.dart';
import 'dadosCadastrais_page.dart';
import 'inicial_page.dart';

class TermosPrivacidadePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Termos de Uso e Privacidade'),
      ),

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
                      builder: (context) => PrincipalPage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(Icons.home),
                      SizedBox(width: 10),
                      Text("Home"),
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

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Termos de Uso',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Aqui você pode colocar os termos de uso do seu aplicativo. '
                'Certifique-se de incluir todas as informações relevantes '
                'para os usuários.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 32),
              Text(
                'Política de Privacidade',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Aqui você pode colocar a política de privacidade do seu aplicativo. '
                'Certifique-se de incluir todas as informações relevantes '
                'sobre como os dados dos usuários serão tratados.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );  
  }
}