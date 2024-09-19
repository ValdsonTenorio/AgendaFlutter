import 'package:agenda/contato.dart';
import 'package:agenda/listagem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class Cadastro extends StatefulWidget {
  final ContatosRepository contatos;
  Cadastro({required this.contatos});

  @override
  State<Cadastro> createState() => _CadastroState(contatos: contatos);
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController =
      MaskedTextController(mask: '(00)00000-0000');
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
            TextFormField(
                decoration: InputDecoration(labelText: 'Entre com Nome'),
                controller: nomeController,
                validator: (nomeController) {
                  if (nomeController == null || nomeController.isEmpty) {
                    return 'Por Favor, insira o nome';
                  }
                  return null;
                }),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Entre com o Telefone',
                    hintText: '(XX) XXXXX-XXXX',
                    hintStyle: TextStyle(color: Colors.grey)),
                controller: telefoneController,
                validator: (telefoneController) {
                  if (telefoneController == null || telefoneController.isEmpty) {
                    return 'Por Favor, insira o Telefone';
                  }
                  return null;
                }),
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'Entre com Email',
                ),
                controller: emailController,
                validator: (emailController) {
                  if (emailController == null || emailController.isEmpty) {
                    return 'Por Favor, insira o Email';
                  }
                  return null;
                }),
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
