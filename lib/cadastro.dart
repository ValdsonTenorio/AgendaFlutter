import 'package:agenda/contato.dart';
import 'package:agenda/listagem.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  final ContatosRepository contatos;
  Cadastro({required this.contatos});

  @override
  State<Cadastro> createState() => _CadastroState(contatos: contatos);
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final ContatosRepository contatos;

  _CadastroState({required this.contatos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Contatos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Entre com Nome'),
              controller: nomeController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Entre com o Telefone'),
              controller: telefoneController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Entre com Email'),
              controller: emailController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  contatos.addContatos(Contato(
                      nome: nomeController.text,
                      email: telefoneController.text,
                      telefone: emailController.text));
                });
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
