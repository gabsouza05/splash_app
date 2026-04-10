import 'package:flutter/material.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  TextEditingController nome = TextEditingController();
  TextEditingController idade = TextEditingController();

  double top = -200;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        top = 50; // posição final
      });
    });
  }

  void entrar() {
    if (nome.text.isEmpty || idade.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Preencha tudo")),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(
          nome: nome.text,
          idade: idade.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // IMAGEM DESCENDO
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            top: top,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/joaninha.png',
                height: 150,
              ),
            ),
          ),

          // CAMPOS
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
              ElevatedButton(
                onPressed: entrar,
                child: Text("Entrar"),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: nome,
                  decoration: InputDecoration(
                    labelText: "Digite seu nome",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: idade,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Digite sua idade",
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
