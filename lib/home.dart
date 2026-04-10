import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String nome;
  final String idade;

  Home({required this.nome, required this.idade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nome),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bem vindo " + nome),
            SizedBox(height: 10),
            Text("Idade: " + idade),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Voltar"),
            )
          ],
        ),
      ),
    );
  }
}
