import 'package:agenda/cadastro.dart';
import 'package:agenda/contato.dart';
import 'package:agenda/listagem.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from( //Propriedade para configurar o tema da página toda
        colorScheme: ColorScheme.fromSwatch(
            cardColor: const Color.fromARGB(255, 65, 64, 64),
            backgroundColor: Colors.white,
            accentColor: Colors.white,
            brightness: Brightness.dark,
            primarySwatch: Colors.green),
      ),
      home: Principal(),
    );
  }
}

class Principal extends StatelessWidget {
  final ContatosRepository contatos = ContatosRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,//Usa a cor primária do tema
          title: Text('Menu Principal'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,// Espaço entre os widgets
              ),
              FilledButton(// Ao clicar nesse botão ele vai para a tela de cadastro
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cadastro(contatos: contatos),
                    ),
                  );
                },
                child: Text("Cadastro"),
              ),
              SizedBox(
                height: 20,
              ),
              FilledButton(// Ao clicar nesse botão ele vai para a tela de Listagem
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Listagem(contatos: contatos),
                    ),
                  );
                },
                child: Text("Listar"),
              ),
            ],
          ),
        ));
  }
}
