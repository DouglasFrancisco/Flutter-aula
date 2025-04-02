import 'package:flutter/material.dart';
import 'package:myapp/pages/inicial_page.dart';
import 'package:myapp/pages/principal_page.dart';
import 'login_page.dart';
import 'termosPrivacidade_page.dart';
import 'principal_page.dart';
import 'inicial_page.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({Key? key}) : super(key: key);

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  final nameController = TextEditingController();
  final dateController = TextEditingController();

  DateTime? selectedDate;
  String? levelSelected;
  int experienceTime = 1;
  double salary = 1000.0;
  bool saving = false;

  final List<String> levels = ['Iniciante', 'Intermediário', 'Avançado'];
  final List<String> lenguages = ['Flutter', 'JavaScript', 'Python', 'Dart'];

  List<DropdownMenuItem<int>> returnItens(int max) {
    return List.generate(max, (index) {
      return DropdownMenuItem<int>(
        value: index + 1,
        child: Text('${index + 1} Ano(s)'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dados Cadastrais')),

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
                      Text('Termos de uso e privacidade'),
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: dateController,
                decoration: InputDecoration(
                  labelText: 'Data de Nascimento',
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  dateController.text = selectedDate.toString();
                },
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nível na Área',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  DropdownButton<String>(
                    value: levelSelected ?? levels.first,
                    items:
                        levels.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        levelSelected = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tempo de Experiência',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  DropdownButton<int>(
                    value: experienceTime,
                    items: returnItens(10),
                    onChanged: (int? value) {
                      setState(() {
                        experienceTime = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Salário',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Slider(
                    value: salary,
                    min: 1000,
                    max: 10000,
                    divisions: 15,
                    label: salary.toStringAsFixed(2),
                    onChanged: (double value) {
                      setState(() {
                        salary = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: CheckboxListTile(
                title: const Text('Salvar dados'),
                value: saving,
                onChanged: (bool? value) {
                  setState(() {
                    saving = value!;
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                   String mensagem = saving ? 'Dados salvos com sucesso!' : 'Dados não foram salvos!';

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(mensagem),
                      duration: Duration(seconds: 2),
                    ),
                  );

                  setState(() {
                    nameController.clear();
                    dateController.clear();
                    selectedDate = null;
                    levelSelected = null;
                    experienceTime = 1;
                    salary = 1000.0;
                    saving = false;
                  });
                },
                child: const Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

