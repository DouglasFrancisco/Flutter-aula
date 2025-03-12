import 'package:flutter/material.dart';
import 'login_page.dart'; // Certifique-se de que este arquivo está corretamente importado

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal Page'),
      ),
      body: Center(
        child: Text('Welcome to the Principal Page!'),
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
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 10),
                  Text('Logout'),
                ],
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}